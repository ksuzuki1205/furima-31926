class OrderConnection
  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :block_number, :building_name, :phone, :item_id, :user_id





  def save
      order_history = OrderHistory.create(item_id: item_id, user_id: user_id)
    Order.create(postal_code: postal_code, region_id: region_id, city: city, block_number: block_number, building_name: building_name, phone: phone, order_history_id: order_history.id)
  end
end