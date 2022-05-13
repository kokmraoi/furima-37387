FactoryBot.define do
  factory :order_shipping do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipalities { '練馬区' }
    address { '石神井台1-1' }
    building_name { 'ビル' }
    telephone_number { '09012345678' }
    user_id { 1 }
    item_id { 1 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
