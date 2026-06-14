require 'rails_helper'

RSpec.describe "Request Clients", type: :request do
  describe "GET /index" do
    it "returns a successful response" do
      user = create(:user)
      sign_in user
      get clients_path
      expect(response).to have_http_status(:success)
    end

    it "redirects to login page if not logged in" do
      get clients_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "POST /create" do
    it "creates a new client" do
      user = create(:user)
      sign_in user
      expect do
        post clients_path, params: {
          client: {
            name: "Test Client",
            email: "test@example.com",
            phone: "123456789",
            company_name: "Test Company",
            status: "active"
          }
        }
      end.to change(Client, :count).by(1)
    end


    it "assigns the client to the current user" do
      user = create(:user)
      sign_in user
      post clients_path, params: {
        client: {
          name: "Test Client",
          email: "test@example.com",
          phone: "123456789",
          company_name: "Test Company",
          status: "active"
        }
      }
      expect(Client.last.user).to eq(user)
    end
  end


  describe "GET /show" do
    it "returns a successful response for own client" do
      user = create(:user)
      client = create(:client, user: user)

      sign_in user

      get client_path(client)

      expect(response).to have_http_status(:success)
    end

    it "does not allow access to another user's client" do
      user = create(:user)
      other_user = create(:user)
      other_client = create(:client, user: other_user)

      sign_in user

      get client_path(other_client)

      expect(response).to have_http_status(:not_found)
    end
  end


  describe "PATCH /update" do
    it "updates own client" do
      user = create(:user)
      client = create(:client, user: user)

      sign_in user

      patch client_path(client), params: {
        client: {
          name: "Updated Client"
        }
      }

      expect(client.reload.name).to eq("Updated Client")
    end

    it "does not allow a user to update another user's client" do
      user = create(:user)
      other_user = create(:user)
      other_client = create(
        :client,
        user: other_user,
        name: "Original Name"
      )
      sign_in user
      patch client_path(other_client), params: {
        client: {
          name: "Hacked Name"
        }
      }
      expect(response).to have_http_status(:not_found)
      expect(other_client.reload.name).to eq("Original Name")
    end
  end
end
