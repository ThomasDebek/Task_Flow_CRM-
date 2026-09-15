require 'rails_helper'

RSpec.describe "Clients::UpdateClients", type: :system do
  before do
    driven_by(:rack_test)
  end


  it "allows a user to update a client" do
    user = create(:user)
    client = create(
      :client,
      user: user,
      name: "Old Client Name",
      email: "old@example.com",
      status: "active"
    )
    login_as_user(user)
    visit edit_client_path(client)
    fill_in "Name", with: "Updated Client Name"
    fill_in "Email", with: "updated@example.com"
    fill_in "Phone", with: "987654321"
    fill_in "Company name", with: "Updated Company"
    select "VIP", from: "Status"

    click_button "Update Client"
    expect(page).to have_content("Client was successfully updated")

    client.reload
    
    expect(client.name).to eq("Updated Client Name")
    expect(client.email).to eq("updated@example.com")
    expect(client.phone).to eq("987654321")
    expect(client.company_name).to eq("Updated Company")
    expect(client.status).to eq("vip")
  end

end
