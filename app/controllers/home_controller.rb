class HomeController < ApplicationController
  ITEMS_PER_PAGE = 5

  def index
    # Counts
    @postsLength = Post.count # Total number of posts
    @eventsLength = Event.count # Total number of events
    @futureEventsLength = Event.where("time > ?", Time.now).count # Total future events
    @pastEventsLength = Event.where("time < ?", Time.now).count # Total past events
    @messagesLength = Message.where(receiver: session[:current_user_id]).count
    @invitesLength = Invite.where(guest: session[:current_user_id]).includes(:event).count

    # Pagination for posts
    @postPage = params.fetch(:postPage, 0).to_i
    @postPage = 0 if @postPage < 0
    @postPage = [ @postPage, (@postsLength / ITEMS_PER_PAGE).floor ].min

    # Pagination for events
    @eventPage = params.fetch(:eventPage, 0).to_i
    @eventPage = 0 if @eventPage < 0
    @eventPage = [ @eventPage, (@eventsLength / ITEMS_PER_PAGE).floor ].min

    @futureEventPage = params.fetch(:futureEventPage, 0).to_i
    @futureEventPage = 0 if @futureEventPage < 0
    @futureEventPage = [ @futureEventPage, (@futureEventsLength / ITEMS_PER_PAGE).floor ].min

    @pastEventPage = params.fetch(:pastEventPage, 0).to_i
    @pastEventPage = 0 if @pastEventPage < 0
    @pastEventPage = [ @pastEventPage, (@pastEventsLength / ITEMS_PER_PAGE).floor ].min

    @messagePage = params.fetch(:messagePage, 0).to_i
    @messagePage = 0 if @messagePage < 0
    @messagePage = [ @messagePage, (@messagesLength / ITEMS_PER_PAGE).floor ].min

    @invitePage = params.fetch(:invitePage, 0).to_i
    @invitePage = 0 if @invitePage < 0
    @invitePage = [ @invitePage, (@invitesLength / ITEMS_PER_PAGE).floor ].min

    # General Posts (All)
    @posts = Post.includes(:comments).order(created_at: :desc)
                 .offset(@postPage * ITEMS_PER_PAGE)
                 .limit(ITEMS_PER_PAGE)

    # General Events (All)
    @events = Event.left_joins(:rsvps)
    .select("events.*, 
      COUNT(CASE WHEN rsvps.status = 'yes' THEN 1 END) AS yes_count, 
      COUNT(CASE WHEN rsvps.status = 'no' THEN 1 END) AS no_count")
    .group('events.id').order(created_at: :desc)
                   .offset(@eventPage * ITEMS_PER_PAGE)
                   .limit(ITEMS_PER_PAGE)

    # Future Events
    @futureEvents = Event.where("time > ?", Time.now).left_joins(:rsvps)
    .select("events.*, 
      COUNT(CASE WHEN rsvps.status = 'yes' THEN 1 END) AS yes_count, 
      COUNT(CASE WHEN rsvps.status = 'no' THEN 1 END) AS no_count")
    .group('events.id')
                         .order(created_at: :desc)
                         .offset(@futureEventPage * ITEMS_PER_PAGE)
                         .limit(ITEMS_PER_PAGE)

    # Past Events
    @pastEvents = Event.where("time < ?", Time.now).left_joins(:rsvps)
    .select("events.*, 
      COUNT(CASE WHEN rsvps.status = 'yes' THEN 1 END) AS yes_count, 
      COUNT(CASE WHEN rsvps.status = 'no' THEN 1 END) AS no_count")
    .group('events.id')
                       .order(created_at: :desc)
                       .offset(@pastEventPage * ITEMS_PER_PAGE)
                       .limit(ITEMS_PER_PAGE)
    @messages = Message.where(receiver: session[:current_user_id])
                       .order(created_at: :desc)
                       .offset(@messagePage * ITEMS_PER_PAGE)
                       .limit(ITEMS_PER_PAGE)
    @invites = Invite.where(guest: session[:current_user_id])
                       .includes(:event)
                       .order(created_at: :desc)
                       .offset(@messagePage * ITEMS_PER_PAGE)
                       .limit(ITEMS_PER_PAGE)
  end
end
