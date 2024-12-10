class AddRsvpCountColumnsToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :yes_rsvps_count, :integer
    add_column :events, :no_rsvps_count, :integer
  end
end
