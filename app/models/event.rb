class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  has_many :saved_events
  has_many :users, through: :saved_events
  # has_many :comments, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :rsvps, dependent: :destroy
  has_many :invites, dependent: :destroy

  # In Event model
def update_rsvp_counts!
  update(
    yes_rsvps_count: rsvps.where(status: 'yes').count,
    no_rsvps_count: rsvps.where(status: 'no').count
  )
end

end
