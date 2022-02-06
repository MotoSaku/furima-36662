FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    city_id { 3 }
    municipalities { 'テスト市' }
    address { 'テスト町1-1' }
    building { 'テストビル101' }
    tel { '09011112222' }
    token { 'test123456789test' }
  end
end
