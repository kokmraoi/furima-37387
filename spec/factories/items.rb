FactoryBot.define do
  factory :item do
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    item_name           { 'テスト商品名' }
    item_description    { 'テスト説明文' }
    item_category_id    { 3 }
    item_status_id      { 3 }
    delivery_charge_id  { 3 }
    prefecture_id       { 3 }
    date_of_shipment_id { 3 }
    item_price          { Faker::Number.within(range: 300..9_999_999) }
  end
end
