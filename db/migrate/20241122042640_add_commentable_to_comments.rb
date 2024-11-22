class AddCommentableToComments < ActiveRecord::Migration[8.0]
  def change
    add_reference :comments, :commentable, polymorphic: true, null: true
  end
end
