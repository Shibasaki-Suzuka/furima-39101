FactoryBot.define do
  factory :order_address do
    user_id        { '1' } 
    item_id        { '1' }
    post_code      { '123-4567' }
    municipalities { '横浜市緑区' }
    address        { '青山1-1-1' }
    call_number    { '09012345678' }
    prefecture_id  { '2' }
  end
end
