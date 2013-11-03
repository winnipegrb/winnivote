FactoryGirl.define do 
  factory :user do
    # sequence(:username) { |n| "foo#{n}" }
    password "foobar"
    password_confirmation { |u| u.password }
    sequence(:email) { |n| "foo#{n}@example.com" }
  end
end