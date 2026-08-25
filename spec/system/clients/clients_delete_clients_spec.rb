require "rails_helper"

RSpec.describe "Clients::DeleteClients", type: :system do
  before do
    driven_by(:selenium, using: :headless_chrome)
  end

  it "allows a user to delete a client" do
    user = create(:user)
    client = create(:client, user: user, name: "Client to delete")

    login_as_user(user)

    visit clients_path

    expect(page).to have_content("Client to delete")

    accept_confirm do
      click_button "Delete"
    end

    expect(page).to have_content("Client was successfully deleted.")
    expect(page).not_to have_content("Client to delete")
    expect(Client.exists?(client.id)).to be false
  end
end