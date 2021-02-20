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
  validates :image, presence: true

  with_options presence: true, numericality: { with: /\A[0-9]+\z/, :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999, message: 'は¥300~¥9,999,999の範囲で半角数字を使用してください' } do
    validates :price
  end


  #ジャンルの選択が「--」の時は保存できないようにする
  with_options presence: true, numericality: { other_than: 1 }  do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :region_id
    validates :delivery_schedule_id
  end

end
