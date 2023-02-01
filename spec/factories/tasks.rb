FactoryBot.define do
  factory :task do
    name { Faker::Lorem.word }
    project
    creator { create(:user) }
    assigned_user { creator }
  end
end
