class CreateRsvps < ActiveRecord::Migration[8.0]
  def change
    create_table :rsvps do |t|
      t.string :host
      t.string :user
      t.text :response
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
