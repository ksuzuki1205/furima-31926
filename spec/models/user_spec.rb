require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    # it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
    # end
    # it 'nicknameが6文字以下であれば登録できる' do
    # end
    # it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
    # end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end


    # it 'passwordが空では登録できない' do
    # end
    # it 'passwordが存在してもpassword_confirmationが空では登録できない' do
    # end
    # it 'nicknameが7文字以上では登録できない' do
    # end
    # it '重複したemailが存在する場合登録できない' do
    # end
    # it 'passwordが5文字以下では登録できない' do
    # end
  end
end


# ニックネームが必須であること =>Done
# メールアドレスが必須であること =>Done
# メールアドレスが一意性であること
# メールアドレスは、@を含む必要があること
# パスワードが必須であること =>Done
# パスワードは、6文字以上での入力が必須であること => Done
# パスワードは、半角英数字混合での入力が必須であること
# パスワードは、確認用を含めて2回入力すること
# パスワードとパスワード（確認用）、値の一致が必須であること
# 新規登録/本人情報確認
# ユーザー本名は、名字と名前がそれぞれ必須であること  =>Done
# ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること 
# ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること =>Done
# ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること
# 生年月日が必須であること =>Done