FactoryBot.define do
  factory :note do
    association :client
    content { "This is a note." }
  end

end
