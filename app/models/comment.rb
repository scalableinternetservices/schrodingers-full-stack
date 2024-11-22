class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  
  validate :comment_has_no_banned_words

  private 
  def comment_has_no_banned_words
    banned_words = ['trump', 'harris', 'apple']
    if banned_words.any? { |word| body&.include?(word.downcase) }
      errors.add(:body, "contains inappropriate or banned words")
    end
  end
end
