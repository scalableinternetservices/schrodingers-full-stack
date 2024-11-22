class AddUsernameToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :username, :string
  end
end
