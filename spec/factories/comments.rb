FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.paragraphs(number: 3).join('\n\n') }
    user { create(:user) }
    task { create(:task) }
  end
end
