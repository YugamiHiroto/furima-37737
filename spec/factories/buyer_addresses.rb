FactoryBot.define do
  factory :buyer_address do
    post_code          { '123-4567' }
    prefecture_id      { 1 }
    city               { '名古屋市' }
    address            { '1-1' }
    building_name      { 'ハイツ' }
    phone_number       { '09012345678' }
    item_id            { 1 }
  end
end
