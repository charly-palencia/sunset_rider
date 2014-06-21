FactoryGirl.define do
  factory :boss do
    name Faker::Name.name
    image_url Faker::Internet.url
    points Faker::Number.number(5)
  end
end
