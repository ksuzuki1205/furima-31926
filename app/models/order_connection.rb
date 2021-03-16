class OrderConnection
  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :block_number, :building_name, :phone, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :block_number
    validates :phone, format: { with: /\A\d{11}\z/, message: "is invalid. Input half-width number only. Character limit is 11." }
    validates :token
  end
 
  with_options presence: true, numericality: { other_than: 1 } do
    validates :region_id
  end


  def save
    order_history = OrderHistory.create(item_id: item_id, user_id: user_id)
    Order.create(postal_code: postal_code, region_id: region_id, city: city, block_number: block_number, building_name: building_name, phone: phone, order_history_id: order_history.id)
  end
end