FactoryGirl.define do 
  factory :idea do
    title       { Faker::Lorem.sentence  }
    description { Faker::Lorem.paragraph }
    trait :with_project do
      project
    end
  end
end
