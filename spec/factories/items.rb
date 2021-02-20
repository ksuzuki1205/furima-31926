FactoryBot.define do
  factory :item do
    # image                  { 'あああああ'}
    title                  { 'あああああ'}
    explanation            { 'アイウエオ' }
    category_id            { Random.rand(2 .. 11) }
    condition_id           { Random.rand(2 .. 6) }
    shipping_charge_id     { Random.rand(2 .. 3) }
    region_id              { Random.rand(2 .. 48) }
    delivery_schedule_id   { Random.rand(2 .. 4) }
    price                  { Random.rand(300 .. 9999999)}                   
    user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
