FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}  
    password_confirmation {password}
    last_name             {'Yamada'}
    first_name            {'Taro'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birthday              {'1982-01-05'}
  end
end 

# nickname              {Faker::Name.initials(number: 2)}
# email                 {Faker::Internet.free_email}
# password              {Faker::Internet.password(min_length: 6)}
# password_confirmation {password}