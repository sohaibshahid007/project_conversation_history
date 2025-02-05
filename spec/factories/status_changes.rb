FactoryBot.define do
  factory :status_change do
    old_status { "active" }
    new_status { "on_hold" }
    association :project
  end
end
