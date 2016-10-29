FactoryGirl.define do
  factory :post do
    title "#{Faker::Hacker.adjective} #{Faker::Hacker.noun} #{Faker::Hacker.verb}"
    body Faker::Hacker.say_something_smart
  end
end
