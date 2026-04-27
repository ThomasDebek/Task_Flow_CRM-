require 'faker'

puts "Cleaning database..."
Task.destroy_all
Lead.destroy_all
Client.destroy_all

puts "Creating clients..."

clients = 10.times.map do
  Client.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    phone: Faker::PhoneNumber.cell_phone,
    company_name: Faker::Company.name,
    status: %w[active inactive vip].sample
  )
end

puts "Creating leads..."

15.times do
  Lead.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    phone: Faker::PhoneNumber.cell_phone,
    company_name: Faker::Company.name,
    status: Lead::STATUSES.sample
  )
end

puts "Creating tasks..."

clients.each do |client|
  rand(3..6).times do
    Task.create!(
      title: Faker::Lorem.sentence(word_count: 3),
      description: Faker::Lorem.paragraph(sentence_count: 2),
      status: Task::STATUSES.sample,
      due_date: [
        Date.today - rand(1..5),
        Date.today,
        Date.today + rand(1..5)
      ].sample,
      client: client
    )
  end
end

puts "Seeds created successfully!"