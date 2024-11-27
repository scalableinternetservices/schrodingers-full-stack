class ChangeRsvpStatusToString < ActiveRecord::Migration[8.0]
  def change
    change_column :rsvps, :status, :string
  end
end