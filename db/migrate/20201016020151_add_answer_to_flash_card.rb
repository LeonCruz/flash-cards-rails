class AddAnswerToFlashCard < ActiveRecord::Migration[6.0]
  def change
    add_column :flash_cards, :answer, :string
  end
end
