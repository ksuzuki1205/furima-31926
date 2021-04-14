class RemoveBrandFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :brand, :string
  end
end
