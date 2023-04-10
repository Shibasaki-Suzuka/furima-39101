FactoryBot.define do
  factory :item do
    item_name             { Faker::Lorem.sentence }
    sentence              { Faker::Lorem.sentence }
    category_id           { '2' }
    status_id             { '2' }
    postage_burden_id     { '2' }
    prefecture_id         { '2' }
    shipping_day_id       { '2' }
    selling_price         { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/testtest.png'), filename: 'testtest.png')
    end
  end
end
