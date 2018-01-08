FactoryBot.define do
  factory :order do
    user
    after(:create) do |order|
      create_list :meal, 3, order: order
    end
  end
end
