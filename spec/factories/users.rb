FactoryGirl.define do 
  factory :user do
    password "foobar12345678"
    password_confirmation { |u| u.password }
    sequence(:email) { |n| "foo#{n}@example.com" }
  end
end