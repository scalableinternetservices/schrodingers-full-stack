class User < ApplicationRecord
    has_many :comments
    has_many :events
    has_many :saved_events
    has_many :events, through: :saved_events
    has_secure_password
    validates :username, presence: true, uniqueness: true  # Ensure username is unique
end
