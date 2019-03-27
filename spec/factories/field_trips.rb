FactoryBot.define do
  factory :field_trip do
    name { "Trip to #{Faker::University.name}" }
  end
end
