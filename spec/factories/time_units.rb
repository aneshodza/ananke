FactoryBot.define do
  factory :time_unit do
    start_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    end_time { Faker::Time.between(from: start_time, to: start_time + 1) }
    description { Faker::Lorem.sentence }
    user { create(:user) }
    task { create(:task) }
  end
end
