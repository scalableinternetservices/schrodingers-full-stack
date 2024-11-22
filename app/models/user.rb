class User < ApplicationRecord
    has_many :comments
    has_many :events
    has_many :saved_events
    has_many :events, through: :saved_events
end

