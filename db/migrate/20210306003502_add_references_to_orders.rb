class AddReferencesToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :order_history, null: false, foreign_key: true
  end
end
