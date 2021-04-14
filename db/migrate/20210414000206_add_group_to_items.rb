class AddGroupToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :group, null: false, foreign_key: true
  end
end
