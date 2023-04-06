FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    encrypted_password    { password }
    last_name             { Gimei.last.kanji }
    first_name            { Gimei.first.hiragana }
    last_name_kana        { Gimei.last.katakana }
    first_name_kana       { Gimei.first.katakana }
    birthday              { '1948-02-19' }
  end
end
