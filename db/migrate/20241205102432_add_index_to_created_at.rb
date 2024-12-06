class AddIndexToCreatedAt < ActiveRecord::Migration[8.0]
  def change
    add_index :comments, :created_at
    add_index :events, :created_at
    add_index :invites, :created_at
    add_index :messages, :created_at
    add_index :posts, :created_at
    add_index :rsvps, :created_at
    add_index :saved_events, :created_at
    add_index :users, :created_at
  end
end
