class CreateFlashCards < ActiveRecord::Migration[6.0]
  def change
    create_table :flash_cards do |t|
      t.string :category, null: false
      t.string :question, null: false
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
