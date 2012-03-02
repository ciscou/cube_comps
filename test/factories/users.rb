FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }

    password              "87654321"
    password_confirmation "87654321"
  end
end
