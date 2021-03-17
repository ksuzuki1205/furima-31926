FactoryBot.define do
  factory :order_connection do
    postal_code            { '123-4567' }
    region_id              { Random.rand(2..48) }
    city                   { 'ああああああああ'} 
    block_number           { 'いいいいいいいい'}
    building_name          { 'うううううううう'}
    phone                  { '08012345678' }
    token                  { 'tok_AAAAAAAAAAAAAAAAAAA' }
    user_id                { Random.rand(1..9_999_999_999_999) }
    item_id                { Random.rand(1..9_999_999_999_999) }
  end
end
