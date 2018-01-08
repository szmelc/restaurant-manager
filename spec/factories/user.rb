FactoryBot.define do
  factory :user do
    first_name            'John'
    last_name             'Smith'
    sequence(:email)      { |n| "exampleuser#{n}@example.com" }
    password              'sashasasha321'
    city                  'Poznań'
    phonenumber           '666 666 666'
    admin                 false

    trait :admin do
      admin               true
    end
  end
end
