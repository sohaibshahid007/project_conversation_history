FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.sentence }
    association :project
  end
end
