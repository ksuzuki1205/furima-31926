require 'rails_helper'

RSpec.describe 'ユーザーログイン機能', type: :system do
  it 'ログインしていない状態で出品ページにアクセスした場合、サインインページに移動すること  ' do
    visit new_item_path
    expect(current_path).to eq(new_user_session_path)
  end

  it 'ログイン状態のユーザーが、商品出品ページへ遷移できること' do
    @user = FactoryBot.create(:user)

    visit new_user_session_path
    expect(current_path).to eq(new_user_session_path)

    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password

    click_on('ログイン')
    expect(current_path).to eq(root_path)

    visit new_item_path
    expect(current_path).to eq(new_item_path)
  end
end
