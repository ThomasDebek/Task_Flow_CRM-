require 'faker'

puts "Cleaning database..."
Task.destroy_all
Lead.destroy_all
Client.destroy_all
Note.destroy_all
User.destroy_all

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


puts "Creating notes..."

note_contents = [
  "Client requested a pricing update for the enterprise package.",
  "Follow-up call scheduled for next Monday.",
  "Waiting for signed contract confirmation.",
  "Client prefers communication by email.",
  "Meeting went well, interested in long-term cooperation.",
  "Asked about integration with existing software.",
  "Client wants a product demo next week.",
  "Important VIP client with recurring projects.",
  "Need to prepare updated project timeline.",
  "Requested additional service documentation.",
  "Client is comparing offers from competitors.",
  "Potential upsell opportunity discussed during meeting."
]

clients.each do |client|
  rand(2..5).times do
    Note.create!(
      content: note_contents.sample,
      client: client,
      created_at: Faker::Time.backward(days: 20)
    )
  end
end



puts "Creating users..."

User.create!(
  email: "admin@example.com",
  password: "password123",
  password_confirmation: "password123"
)

User.create!(
  email: "admin@gmail.com",
  password: "secret",
  password_confirmation: "secret"
)

puts "Login credentials:"
puts "admin@example.com / password123"
puts "admin@gmail.com / secret"

puts "Seeds created successfully!"