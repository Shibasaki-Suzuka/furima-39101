FactoryBot.define do
  factory :order_address do
    post_code      { '123-4567' }
    municipalities { '横浜市緑区' }
    address        { '青山1-1-1' }
    call_number    { '09012345678' }
    prefecture_id  { '2' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
