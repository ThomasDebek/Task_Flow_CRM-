require "rails_helper"

RSpec.describe "User Login", type: :system do
  it "allows a user to log in" do
    user = create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "password123"

    click_button "Log in"

    expect(page).to have_content("Signed in successfully")
  end
end