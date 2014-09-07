# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reply do
    title Faker::Lorem.words(4).join(' ')
    body Faker::Lorem.words(20).join(' ')
    association :post
    association :user
  end
end
