FactoryBot.define do
  factory :item do
    # image                  { 'あああああ'}
    title                  { 'あああああ'}
    explanation            { 'アイウエオ' }
    category_id            { 2 }
    condition_id           { 2 }
    shipping_charge_id     { 2 }
    region_id              { 2 }
    delivery_schedule_id   { 2 }
    price                  { 20000 }                   
    user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
