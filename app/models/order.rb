class Order < ApplicationRecord
  with_options presence: true do
    validates  :postal_code
    validates  :region_id
    validates  :city
    validates  :block_number
    validates  :phone
  end
end
