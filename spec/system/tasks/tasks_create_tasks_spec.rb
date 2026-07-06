require 'rails_helper'

RSpec.describe "Tasks::CreateTasks", type: :system do
  before do
    driven_by(:rack_test)
  end
  
    it "allows a user to create a task for a client" do
      user = create(:user)
      client = create(:client, user: user)

      login_as_user(user)

      visit new_client_task_path(client)

      fill_in "Title", with: "Call client"
      fill_in "Description", with: "Discuss next project steps"
      select "Pending", from: "Status"
      fill_in "Due date", with: Date.tomorrow

      click_button "Create Task"

      expect(page).to have_content("Task created")
      expect(Task.last.title).to eq("Call client")
      expect(Task.last.client).to eq(client)
    end
  end