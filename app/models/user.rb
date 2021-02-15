class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,            presence: true
  validates :birthday,            presence: true

  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角カナ文字を使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  VALID_PASSWORD_REGEX = /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/
  validates :password, format: { with: VALID_PASSWORD_REGEX }
end
