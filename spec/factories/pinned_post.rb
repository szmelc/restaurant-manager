FactoryBot.define do
  factory :pinned_post do
    content     'abcdefghijklmnoprstquwxyz'
    created_at  Time.now - 50
  end

  trait :expired do
    created_at  Time.now - 90000
  end
end
