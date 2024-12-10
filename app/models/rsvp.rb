class Rsvp < ApplicationRecord
  belongs_to :event
  after_save :update_event_rsvp_counts
  after_destroy :update_event_rsvp_counts
  private
  def update_event_rsvp_counts
    event.update_rsvp_counts!
  end
  validates :status, inclusion: { in: ['yes', 'no', 'maybe'] }
end
