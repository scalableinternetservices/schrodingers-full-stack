class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events, if_not_exists: true do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
