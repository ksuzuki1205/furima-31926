class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :ship_from_area
  belongs_to :delivery_schedule

  #空の投稿を保存できないようにする
  validates :title, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :shipping_charge_id, numericality: { other_than: 1 } 
  validates :ship_from_area_id, numericality: { other_than: 1 } 
  validates :delivery_schedule_id, numericality: { other_than: 1 } 


end
