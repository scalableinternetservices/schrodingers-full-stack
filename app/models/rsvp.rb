class Rsvp < ApplicationRecord
  belongs_to :event
  # enum status: { no: 0, yes: 1, not_sure: 2 }
end
