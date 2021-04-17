class ItemsTag
  include ActiveModel::Model
  attr_accessor :message, :name, :title, :explanation, :images, :price, :category_id, :condition_id, :shipping_charge_id, :region_id, :delivery_schedule_id, :user_id, :group_id

  with_options presence: true do
    validates :title
    validates :explanation
    validates :images
    validates :message    
  end


  validates :name,  presence: true
  # validates :name,  uniqueness: true

  with_options presence: true,
               numericality: { with: /\A[0-9]+\z/, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                               message: 'は¥300~¥9,999,999の範囲で半角数字を使用してください' } do
    validates :price
  end

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :region_id
    validates :delivery_schedule_id
  end

  def save
    tag = Tag.where(name: name).first_or_initialize
    tag.save
    item = Item.create(message: message, title: title, explanation: explanation, images: images, price: price, category_id: category_id, condition_id: condition_id, shipping_charge_id: shipping_charge_id, region_id: region_id, delivery_schedule_id: delivery_schedule_id, group_id: group_id, user_id: user_id)
    item_tag_relation = ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

end


# class OrderConnection
#   include ActiveModel::Model
#   attr_accessor :postal_code, :region_id, :city, :block_number, :building_name, :phone, :item_id, :user_id, :token

#   with_options presence: true do
#     validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
#     validates :city
#     validates :block_number
#     validates :phone, format: { with: /\A\d{1,11}\z/, message: "is invalid. Input half-width number only. Character limit is 11." }
#     validates :token
#     validates :user_id
#     validates :item_id
#   end
 
#   with_options presence: true, numericality: { other_than: 1 } do
#     validates :region_id
#   end


#   def save
#     order_history = OrderHistory.create(item_id: item_id, user_id: user_id)
#     Order.create(postal_code: postal_code, region_id: region_id, city: city, block_number: block_number, building_name: building_name, phone: phone, order_history_id: order_history.id)
#   end
# end