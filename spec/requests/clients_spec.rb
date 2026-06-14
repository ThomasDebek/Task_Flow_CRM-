require 'rails_helper'

RSpec.describe "Clients", type: :request do
  describe "GET /index" do
    it "returns a successful response" do
      user = create(:user)
      sign_in user
      get clients_path
      expect(response).to have_http_status(:success)
    end
  end
end
