class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.references :user, null: false
      t.text :title, null: false
      t.string :content, null: false
      t.timestamps
    end
  end
end
