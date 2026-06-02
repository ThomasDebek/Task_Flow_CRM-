FactoryBot.define do
  factory :lead do
    association :user
    first_name { "John" }
    last_name { "Doe" }
    email { "<EMAIL>" }
    phone { "1234567890" }
    company_name { "Test Company" }
    status { "active" }
  end
end
