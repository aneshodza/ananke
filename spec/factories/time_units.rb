FactoryBot.define do
  factory :time_unit do
    start_time { Faker::Time.between(from: Time.now - 1.hours,
                                     to: Time.now - 30.minutes) }
    end_time { Faker::Time.between(from: start_time + 1.minute, to: Time.now - 1.minute) }
    description { Faker::Lorem.sentence }
    user { create(:user) }
    task { create(:task) }
  end
end
