FactoryBot.define do
  factory :dish do
    sequence(:name)  { |n| "Shrimps_#{n}"}
    price            20
    category        'Mięcho'
    description     'Perfect Shrimps'
  end

  trait :without_name do
    name  nil
  end

  trait :without_price do
    price nil
  end

  trait :invalid_price_format do
    price '2-x'
  end
end
