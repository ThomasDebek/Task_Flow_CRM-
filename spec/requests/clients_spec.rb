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
end
