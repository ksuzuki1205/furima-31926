FactoryBot.define do
  factory :order_history do
   association :user
   association :item    
  end
end
