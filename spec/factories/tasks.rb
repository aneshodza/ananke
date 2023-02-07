FactoryBot.define do
  factory :task do
    name { Faker::Lorem.word }
    project
    creator { create(:user) }
    description { Faker::Lorem.sentence }
    assigned_user { creator }
  end
end
