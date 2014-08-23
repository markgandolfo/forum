# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :section do
    title "MyString"
    description "MyText"
    order 1
    category "Category"
  end
end
