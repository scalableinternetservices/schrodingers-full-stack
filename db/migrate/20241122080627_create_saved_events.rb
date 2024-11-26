class CreateSavedEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :saved_events do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end