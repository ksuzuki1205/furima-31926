class RemoveAuthorFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :ship_from_area_id, :integer
  end
end
