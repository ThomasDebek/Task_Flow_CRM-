FactoryBot.define do
  factory :task do
    association :client
    title { "Test Task" }
    description { "Task description" }
    status { "pending" }
    due_date { Date.today + 3.days }
  end
end
