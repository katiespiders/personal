require 'faker'

FactoryGirl.define do
  factory :post do |f|
    f.title { Faker::Lorem.sentence }
    f.content { Faker::Lorem.paragraphs.join("\n") }
    f.published_at { Faker::Time.backward(30) }
  end
end
