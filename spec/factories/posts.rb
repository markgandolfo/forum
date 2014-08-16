# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    post nil
    title "MyString"
    body "MyText"
    user nil
    closed false
    stick false
  end
end
