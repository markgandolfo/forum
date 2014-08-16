# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reply do
    title "MyString"
    body "MyText"
    post nil
    user nil
  end
end
