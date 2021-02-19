class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :region
  belongs_to :delivery_schedule
  has_one_attached :image

  #空の投稿を保存できないようにする
  validates :title, presence: true
  validates :explanation, presence: true
  validates :price, presence: true

  
  #ジャンルの選択が「--」の時は保存できないようにする
  with_options presence: true, numericality: { other_than: 1 }  do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :region_id
    validates :delivery_schedule_id
  end

end
