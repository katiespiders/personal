require 'faker'

FactoryGirl.define do
  factory :post do |f|
    f.title { Faker::Lorem.sentence }
    f.content { Faker::Lorem.paragraphs(10).join("\n") }

    trait :published do
      published? true
      published_at Faker::Time.backward(30)
    end
  end

  
end
