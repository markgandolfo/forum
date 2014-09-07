# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username                Faker::Internet.user_name
    email                   Faker::Internet.safe_email
    password                "Password1"
    password_confirmation   "Password1"
    role                    "member"
  end

  factory :admin_user, :parent => :user do
    role                    "admin"
  end

end
