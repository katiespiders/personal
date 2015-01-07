require 'faker'

FactoryGirl.define do
  factory :post do |f|
    f.title { Faker::Lorem.sentence }
    f.body { Faker::Lorem.paragraphs(10).join("\n") }

    trait :published do
      published? true
      published_at Faker::Time.backward(30)
    end

    trait :invalid do
      title nil
    end
  end


end
