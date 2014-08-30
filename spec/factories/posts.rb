# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'
FactoryGirl.define do
  factory :post do
    title Faker::Lorem.words(4)
    body Faker::Lorem.words(20)
    association :user
    association :section
  end
end
