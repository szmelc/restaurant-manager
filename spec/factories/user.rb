FactoryBot.define do
  factory :user, aliases: [:admin] do
    first_name            'John'
    sequence(:last_name)  { |n| "Smith_#{n}" }
    sequence(:email)      { |n| "exampleuser#{n}@example.com" }
    password              'sashasasha321'
    city                  'Poznań'
    description           'come to brazil plx'
    phonenumber           '666 666 666'
    admin                 false

    trait :admin do
      admin               true
    end
  end
end
