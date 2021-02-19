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
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品状態の情報がないと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it '配送料の負担の情報がないと登録できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
      end

      #   it 'emailが空では登録できない' do
    #     @user.email = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Email can't be blank")
    #   end

    #   it 'passwordが空では登録できない' do
    #     @user.password = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Password can't be blank")
    #   end

    #   it 'last_nameが空では登録できない' do
    #     @user.last_name = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Last name can't be blank")
    #   end

    #   it 'first_nameが空では登録できない' do
    #     @user.first_name = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("First name can't be blank")
    #   end

    #   it 'last_name_kanaが空では登録できない' do
    #     @user.last_name_kana = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    #   end

    #   it 'first_name_kanaが空では登録できない' do
    #     @user.first_name_kana = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("First name kana can't be blank")
    #   end

    #   it 'birthdayが空では登録できない' do
    #     @user.birthday = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Birthday can't be blank")
    #   end

    #   it 'passwordが5文字以下では登録できない' do
    #     @user.password = '00000'
    #     @user.password_confirmation = '00000'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    #   end

    #   it 'ユーザー名前は、半角では登録できない' do
    #     @user.first_name = 'abcd'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
    #   end

    #   it 'ユーザー苗字は、半角では登録できない' do
    #     @user.last_name = 'abcd'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
    #   end

    #   it 'ユーザー苗字カナは、半角では登録できない' do
    #     @user.last_name_kana = 'abcd'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('Last name kana 全角カナ文字を使用してください')
    #   end

    #   it 'ユーザー名前カナは、半角では登録できない' do
    #     @user.first_name_kana = 'abcd'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('First name kana 全角カナ文字を使用してください')
    #   end

    #   it 'ユーザー苗字カナは、ひらがなでは登録できない' do
    #     @user.last_name_kana = 'あいうえお'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('Last name kana 全角カナ文字を使用してください')
    #   end

    #   it 'ユーザー名前カナは、ひらがなでは登録できない' do
    #     @user.first_name_kana = 'あいうえお'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('First name kana 全角カナ文字を使用してください')
    #   end

    #   it 'ユーザー苗字カナは、漢字では登録できない' do
    #     @user.last_name_kana = '花鳥風月'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('Last name kana 全角カナ文字を使用してください')
    #   end

    #   it 'ユーザー名前カナは、漢字では登録できない' do
    #     @user.first_name_kana = '花鳥風月'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('First name kana 全角カナ文字を使用してください')
    #   end

    #   it 'メールアドレスは、@を含まないと登録できない' do
    #     @user.email = 'testgmail.com'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('Email is invalid')
    #   end

    #   it 'パスワードとパスワード（確認用）の値の一致がしないと登録できない' do
    #     @user.password = 'aaa111'
    #     @user.password_confirmation = 'bbb222'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    #   end

    #   it 'パスワードは、半角数字だけでは登録できない' do
    #     @user.password = '1234567'
    #     @user.password_confirmation = '1234567'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('Password is invalid')
    #   end

    #   it 'パスワードは、半角英字だけでは登録できない' do
    #     @user.password = 'abcdefg'
    #     @user.password_confirmation = 'abcdefg'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('Password is invalid')
    #   end

    #   it 'パスワードは、全角では登録できない' do
    #     @user.password = '１２３ＡＢＣＤ'
    #     @user.password_confirmation = '１２３ＡＢＣＤ'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('Password is invalid')
    #   end

    #   it '重複したemailが存在する場合登録できない' do
    #     @user.save
    #     another_user = FactoryBot.build(:user)
    #     another_user.email = @user.email
    #     another_user.valid?
    #     expect(another_user.errors.full_messages).to include('Email has already been taken')
    #   end
    end

  #   context 'ユーザ登録ができる時' do
  #     it '入力内容に不備がなければ登録できる' do
  #       expect(@user).to be_valid
  #     end
  #   end
  end
end
