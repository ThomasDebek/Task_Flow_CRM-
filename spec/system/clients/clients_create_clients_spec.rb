require 'rails_helper'

RSpec.describe "Clients::CreateClients", type: :system do
  it "allows a user to create a client" do
    user = create(:user)
    sign_in user

    visit new_client_path

    fill_in "Name", with: "System Test Client"
    fill_in "Email", with: "system@example.com"
    fill_in "Phone", with: "123456789"
    fill_in "Company name", with: "System Company"
    select "active", from: "Status"

    click_button "Create Client"

    expect(page).to have_content("Client was successfully created")
    expect(Client.last.name).to eq("System Test Client")
  end
end
