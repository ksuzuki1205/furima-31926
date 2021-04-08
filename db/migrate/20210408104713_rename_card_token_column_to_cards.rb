class RenameCardTokenColumnToCards < ActiveRecord::Migration[6.0]
  def change
    rename_column :cards, :card_token, :token
  end
end
