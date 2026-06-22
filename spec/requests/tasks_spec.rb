require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "POST /create" do
    it "creates a task for own client" do
      user = create(:user)
      client = create(:client, user: user)
      sign_in user
      expect {
        post client_tasks_path(client), params: {
          task: {
            title: "Test Task",
            description: "Task description",
            status: "pending",
            due_date: Date.tomorrow
          }
        }
      }.to change(Task, :count).by(1)
      expect(Task.last.client).to eq(client)
    end

    it "does not allow creating a task for another user's client" do
      user = create(:user)
      other_user = create(:user)
      other_client = create(:client, user: other_user)
      sign_in user
      expect {
        post client_tasks_path(other_client), params: {
          task: {
            title: "Hacked Task",
            description: "Task description",
            status: "pending",
            due_date: Date.tomorrow
          }
        }
      }.not_to change(Task, :count)
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "PATCH /update" do
    it "updates a task for own client" do
      user = create(:user)
      client = create(:client, user: user)
      task = create(:task, client: client, title: "Old Task")
      sign_in user
      patch client_task_path(client, task), params: {
        task: {
          title: "Updated Task"
        }
      }
      expect(task.reload.title).to eq("Updated Task")
    end

    it "does not allow updating a task from another user's client" do
      user = create(:user)
      other_user = create(:user)
      other_client = create(:client, user: other_user)
      task = create(:task, client: other_client, title: "Original Task")
      sign_in user
      patch client_task_path(other_client, task), params: {
        task: {
          title: "Hacked Task"
        }
      }
      expect(response).to have_http_status(:not_found)
      expect(task.reload.title).to eq("Original Task")
    end
  end

  describe "DELETE /destroy" do
    it "deletes a task from own client" do
      user = create(:user)
      client = create(:client, user: user)
      task = create(:task, client: client)
      sign_in user
      expect {
        delete client_task_path(client, task)
      }.to change(Task, :count).by(-1)
    end

    it "does not allow deleting a task from another user's client" do
      user = create(:user)
      other_user = create(:user)
      other_client = create(:client, user: other_user)
      task = create(:task, client: other_client)
      sign_in user
      expect {
        delete client_task_path(other_client, task)
      }.not_to change(Task, :count)
      expect(response).to have_http_status(:not_found)
    end

  end
end
