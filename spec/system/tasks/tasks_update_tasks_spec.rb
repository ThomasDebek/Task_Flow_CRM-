require 'rails_helper'

RSpec.describe "Tasks::UpdateTasks", type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) { create(:user) }
  let(:client) { create(:client, user: user) }
  let(:task) { create(:task, client: client) }

  before do
    login_as(user, scope: :user)
  end

  it "updates a task" do
    visit edit_client_task_path(client, task)
    fill_in "Title", with: "Updated task title"
    fill_in "Description", with: "Updated task description"
    click_button "Update Task"
    expect(page).to have_content("Updated task title")
    expect(page).to have_content("Updated task description")
  end

end
