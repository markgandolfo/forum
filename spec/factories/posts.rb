# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'
FactoryGirl.define do
  factory :post do
    title Faker::Lorem.words(4).join(' ')
    body Faker::Lorem.words(20).join(' ')
    association :user
    association :section
  end
end
