class User < ApplicationRecord
    has_many :comments
    has_many :events
    has_many :saved_events
    has_many :events, through: :saved_events
  
    has_secure_password
  
   # Add Active Storage attachment for profile picture
   has_one_attached :profile_picture  # This allows users to upload a single file (e.g., avatar)
  
    validates :username, presence: true, uniqueness: true  # Ensure username is unique
  end
  