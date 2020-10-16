class RenameUserReferenceInFlashCard < ActiveRecord::Migration[6.0]
  def change
    rename_column :flash_cards, :users_id, :user_id
  end
end
