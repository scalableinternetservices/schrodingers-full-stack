class AddEventIdToComments < ActiveRecord::Migration[8.0]
  class AddEventIdToComments < ActiveRecord::Migration[8.0]
    def change
      unless column_exists?(:comments, :event_id)
        add_column :comments, :event_id, :integer
      end
    end
  end
end
