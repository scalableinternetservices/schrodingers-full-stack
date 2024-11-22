class AddEventIdToComments < ActiveRecord::Migration[8.0]
  def change
    add_column :comments, :event_id, :integer
  end
end
