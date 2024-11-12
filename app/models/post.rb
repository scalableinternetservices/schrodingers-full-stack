class Post < ApplicationRecord
  has_many :comments
  validates :title, presence: true
  validates :body, presence: true
  validates :username, presence: true
  
end
