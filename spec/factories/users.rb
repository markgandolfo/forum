# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
    username                Faker::Internet.user_name
    email
    password                "Password1"
    password_confirmation   "Password1"
    role                    "member"
  end

  factory :admin_user, :parent => :user do
    role                    "admin"
  end

end
