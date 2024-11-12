class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :body
      t.string :sender
      t.string :receiver

      t.timestamps
    end
  end
end
