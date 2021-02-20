require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができない時' do
      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it '商品の説明が空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリーの情報がないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it '商品状態の情報がないと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end

      it '配送料の負担の情報がないと登録できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge must be other than 1')
      end

      it '発送元の地域の情報がないと登録できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Region must be other than 1')
      end

      it '発送までの日数の情報がないと登録できない' do
        @item.delivery_schedule_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery schedule must be other than 1')
      end

      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '価格は全角では登録できない' do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は¥300~¥9,999,999の範囲で半角数字を使用してください')
      end

      it '価格は¥299以下では登録できない' do
        @item.price = Random.rand(-9_999_999_999_999_999_999_999..299)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は¥300~¥9,999,999の範囲で半角数字を使用してください')
      end

      it '価格は¥9,999,999以上では登録できない' do
        @item.price = Random.rand(10_000_000..99_999_999_999_999_999_999_999)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は¥300~¥9,999,999の範囲で半角数字を使用してください')
      end
    end

    context '商品出品ができる時' do
      it '入力内容に不備がなければ登録できる' do
        expect(@item).to be_valid
      end
    end
  end
end
