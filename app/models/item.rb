class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :region
  belongs_to :delivery_schedule
  has_many_attached :images
  has_one :order_history
  belongs_to :group
  has_many :item_tag_relations
  has_many :tags, through: :item_tag_relations

  # 空の投稿を保存できないようにする


end
