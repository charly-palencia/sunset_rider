FactoryGirl.define do
  factory :score do
    name Faker::Name.name
    enemies_killed Faker::Number.number(1)
  end
end
