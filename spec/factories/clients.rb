FactoryBot.define do
  factory :client do
    association :user

    sequence(:name) { |n| "Test Client #{n}" }
    sequence(:email) { |n| "client#{n}@example.com" }
    phone { "123456789" }
    company_name { "Test Company" }
    status { "active" }
  end
end