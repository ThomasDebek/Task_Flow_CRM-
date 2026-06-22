require 'rails_helper'

RSpec.describe "Leads", type: :request do
  describe "GET /index" do
    it "returns a successful response" do
      user = create(:user)
      sign_in user
      get leads_path
      expect(response).to have_http_status(:success)
    end

    it "redirects to login page if not logged in" do
      get leads_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "POST /create" do
    it "creates a new lead" do
      user = create(:user)
      sign_in user
      expect do
        post leads_path, params: {
          lead: {
            first_name: "John",
            last_name: "Doe",
            email: "john@example.com",
            phone: "123456789",
            company_name: "Test Company",
            status: "new"
          }
        }
      end.to change(Lead, :count).by(1)
    end
  end


  describe "POST /create" do
    it "creates a new lead" do
      user = create(:user)
      sign_in user
      expect do
        post leads_path, params: {
          lead: {
            first_name: "John",
            last_name: "Doe",
            email: "john@example.com",
            phone: "123456789",
            company_name: "Test Company",
            status: "new"
          }
        }
      end.to change(Lead, :count).by(1)
    end

    it "assigns the lead to the current user" do
      user = create(:user)
      sign_in user
      post leads_path, params: {
        lead: {
          first_name: "John",
          last_name: "Doe",
          email: "john@example.com",
          phone: "123456789",
          company_name: "Test Company",
          status: "new"
        }
      }
      expect(Lead.last.user).to eq(user)
    end

  end


  describe "GET /show" do
    it "returns a successful response for own lead" do
      user = create(:user)
      lead = create(:lead, user: user)
      sign_in user
      get lead_path(lead)
      expect(response).to have_http_status(:success)
    end

    it "does not allow access to another user's lead" do
      user = create(:user)
      other_user = create(:user)
      other_lead = create(:lead, user: other_user)
      sign_in user
      get lead_path(other_lead)
      expect(response).to have_http_status(:not_found)
    end
  end



end
