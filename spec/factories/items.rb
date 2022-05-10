FactoryBot.define do
  factory :item do
    name                   { 'スニーカー' }
    description            { '新品のスニーカーです' }
    status_id              { 2 }
    shipping_cost_id       { 2 }
    shipping_day_id        { 2 }
    price                  { '1000' }
    category_id            { 2 }
    prefecture_id          { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end
  end
end
