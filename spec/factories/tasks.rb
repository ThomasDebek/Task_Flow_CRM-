FactoryBot.define do
  factory :task do
    association :client
    title { "Task Title" }
    description { "Task Description" }
    status { "pending" }
    due_date { Date.today + 3.days }
  end
end
