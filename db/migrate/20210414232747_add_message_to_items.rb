class AddMessageToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :message, :string, null: false
  end
end
