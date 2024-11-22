class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  has_many :comments, as: :commentable, dependent: :destroy
end
