class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  has_many :saved_events
  has_many :users, through: :saved_events
  # has_many :comments, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
end
