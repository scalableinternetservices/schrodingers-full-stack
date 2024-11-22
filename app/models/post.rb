class Post < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true
  validates :username, presence: true
  
end
