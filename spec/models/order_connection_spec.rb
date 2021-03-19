require 'rails_helper'

RSpec.describe OrderConnection, type: :model do
  
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_connection = FactoryBot.build(:order_connection, user_id: @user.id, item_id: @item.id)
    sleep(1)
  end

  describe '商品購入' do
    context '商品購入ができる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_connection).to be_valid
      end
      it '建物名が抜けていても登録できる' do
        @order_connection.building_name = ''
        @order_connection.valid?
        expect(@order_connection.errors.full_messages).to include()
      end
    end

    context '商品購入ができない時' do
      it '正しいクレジットカードの情報で無いときは決済できない' do
        @order_connection.token = nil
        @order_connection.valid?
        expect(@order_connection.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空では登録できない' do
        @order_connection.postal_code = ''
        @order_connection.valid?
        expect(@order_connection.errors.full_messages).to include("Postal code can't be blank")
      end

      it '都道府県が空では登録できない' do
        @order_connection.region_id = ''
        @order_connection.valid?
        expect(@order_connection.errors.full_messages).to include("Region can't be blank", "Region is not a number")
      end

      it '都道府県が初期値（region_id = 1）では登録できない' do
        @order_connection.region_id = 1
        @order_connection.valid?
        expect(@order_connection.errors.full_messages).to include("Region must be other than 1")
      end

      it '市区町村が空では登録できない' do
        @order_connection.city = ''
        @order_connection.valid?
        expect(@order_connection.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では登録できない' do
        @order_connection.block_number = ''
        @order_connection.valid?
        expect(@order_connection.errors.full_messages).to include("Block number can't be blank")
      end

      it '電話番号が空では登録できない' do
        @order_connection.phone = ''
        @order_connection.valid?
        expect(@order_connection.errors.full_messages).to include("Phone can't be blank")
      end

      it '郵便番号にはハイフンがないと登録できない' do
        @order_connection.postal_code = '1234567'
        @order_connection.valid?
        expect(@order_connection.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '電話番号は11桁以内でないと登録できない' do
        @order_connection.phone = '080123456789'
        @order_connection.valid?
        expect(@order_connection.errors.full_messages).to include("Phone is invalid. Input half-width number only. Character limit is 11.")
      end

      it '電話番号はハイフンがあると登録できない' do
        @order_connection.phone = '080-2345-78'
        @order_connection.valid?
        expect(@order_connection.errors.full_messages).to include("Phone is invalid. Input half-width number only. Character limit is 11.")
      end

      it '電話番号は英数混合では登録できない' do
        @order_connection.phone = '080abcd1234'
        @order_connection.valid?
        expect(@order_connection.errors.full_messages).to include("Phone is invalid. Input half-width number only. Character limit is 11.")
      end

      it 'user_idが空では登録できない' do
        @order_connection.user_id = ''
        @order_connection.valid?
        expect(@order_connection.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できない' do
        @order_connection.item_id = ''
        @order_connection.valid?
        expect(@order_connection.errors.full_messages).to include("Item can't be blank")
      end


    end
  end
end