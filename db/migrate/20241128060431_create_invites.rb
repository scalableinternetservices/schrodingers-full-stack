class CreateInvites < ActiveRecord::Migration[8.0]
  def change
    create_table :invites do |t|
      t.string :guest
      t.text :note
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
