FactoryBot.define do
  factory :project do
    name { Faker::Company.name }
  end
end
