class Rsvp < ApplicationRecord
  belongs_to :event
  validates :status, inclusion: { in: ['yes', 'no', 'maybe'] }
  # enum status: { no: 0, yes: 1}
end
