FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "foo#{n}@test.pl"}
    password { "password" }
    username { Faker::Internet.username}
  end
end
