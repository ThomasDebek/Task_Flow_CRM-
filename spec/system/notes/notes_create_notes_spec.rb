require 'rails_helper'

RSpec.describe "Notes::CreateNotes", type: :system do
  before do
    driven_by(:rack_test)
  end
  it "allows a user to add a note to a client" do
    user = create(:user)
    client = create(:client, user: user)

    login_as_user(user)

    visit client_path(client)

    fill_in "Content", with: "This is an important client note."

    click_button "Add note"

    expect(page).to have_content("Note created")
    expect(page).to have_content("This is an important client note.")
  end
end