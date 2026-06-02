FactoryBot.define do
  factory :lead do
    association :user
    first_name { "John" }
    last_name { "Doe" }
    email { Faker::Internet.unique.email }
    phone { "123456789" }
    company_name { "Test Company" }
    status { "new" }
  end
end
