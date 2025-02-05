FactoryBot.define do
  factory :project do
    title { Faker::Lorem.unique.sentence(word_count: 3) }
    description { Faker::Lorem.paragraph }
    status { "active" }
  end
end
