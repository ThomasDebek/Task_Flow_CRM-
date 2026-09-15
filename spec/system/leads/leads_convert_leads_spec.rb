require "rails_helper"

RSpec.describe "Leads::ConvertLead", type: :system do
  it "allows a user to convert a lead into a client" do
    user = create(:user)

    lead = create(
      :lead,
      user: user,
      first_name: "John",
      last_name: "Doe",
      email: "john@example.com",
      phone: "123456789",
      company_name: "Test Company",
      status: "new"
    )

    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "password123"
    click_button "Log in"

    visit lead_path(lead)

    expect {
      click_button "Convert to client"
    }.to change(Client, :count).by(1)
                               .and change(Lead, :count).by(-1)

    expect(page).to have_content("Lead was successfully converted to client.")

    client = Client.last
    expect(client.name).to eq("John Doe")
    expect(client.email).to eq("john@example.com")
    expect(client.user).to eq(user)
  end
end