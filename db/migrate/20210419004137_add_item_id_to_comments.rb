class AddItemIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :item_id, :integer
  end
end
