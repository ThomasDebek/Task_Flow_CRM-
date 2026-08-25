require "rails_helper"

RSpec.describe "Delete task", type: :system do
  before do
    driven_by(:selenium, using: :headless_chrome)
  end

  let(:user) { create(:user) }
  let(:client) { create(:client, user: user) }
  let!(:task) { create(:task, client: client, title: "Task to delete") }

  before do
    login_as_user(user)
  end

  it "deletes a task" do
    visit client_path(client)

    expect(page).to have_content("Task to delete")

    accept_confirm do
      click_link "Delete", href: client_task_path(client, task)
    end

    expect(page).not_to have_content("Task to delete")
    expect(Task.exists?(task.id)).to be false
  end
end