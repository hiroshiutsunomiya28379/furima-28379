FactoryBot.define do
  factory :item do
    name {"Faker::Lorem.characters(16)"}
    description {"setsumei"}
    price {2000}
    category_id {1}
    status_id {1}
    ship_charge_id {1}
    ship_region_id {1}
    ship_day_id {1}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
