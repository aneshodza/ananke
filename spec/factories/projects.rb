FactoryBot.define do
  factory :project do
    name { Faker::Company.name }
    project_owner { create(:user) }
  end
end
