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

end
