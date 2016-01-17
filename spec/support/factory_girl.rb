require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person#{n}@example.com"}
    first_name "Mike"
    last_name "Miller"
    password "password"
    password_confirmation "password"
  end
end
