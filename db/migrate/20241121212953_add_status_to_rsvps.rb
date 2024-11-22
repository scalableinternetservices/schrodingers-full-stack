class AddStatusToRsvps < ActiveRecord::Migration[8.0]
  def change
    add_column :rsvps, :status, :integer
  end
end
