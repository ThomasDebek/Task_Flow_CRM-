require 'rails_helper'

RSpec.describe "Leads::CreateLeads", type: :system do
  before do
    # driven_by(:selenium_chrome)
    driven_by(:rack_test)
  end

    it "allows a user to create a lead" do
      user = create(:user)
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: "password123"
      click_button "Log in"
      visit new_lead_path
      fill_in "First name", with: "John"
      fill_in "Last name", with: "Doe"
      fill_in "Email", with: "john@example.com"
      fill_in "Phone", with: "123456789"
      fill_in "Company name", with: "Test Company"
      select "New", from: "Status"
      click_button "Create Lead"
      expect(page).to have_content("Lead was successfully created")
      expect(Lead.last.full_name).to eq("John Doe")
    end
  end