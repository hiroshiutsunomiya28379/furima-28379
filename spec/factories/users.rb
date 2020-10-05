FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {"a12345"}
    password_confirmation {"a12345"}
    first_name { "山田" }
    last_name { "太郎" }
    first_name_kana { "ヤマダ" }
    last_name_kana { "タロウ" }
    birthday {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
  end
end
