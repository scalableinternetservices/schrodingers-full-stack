class RemoveHostFromRsvp < ActiveRecord::Migration[8.0]
  def change
    remove_column :rsvps, :host, :string
  end
end
