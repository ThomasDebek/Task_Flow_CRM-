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


  describe "PATCH /update" do
    it "allows a user to update their own lead" do
      user = create(:user)
      lead = create(:lead, user: user)
      sign_in user
      patch lead_path(lead), params: {
        lead: {
          first_name: "Updated"
        }
      }
      expect(lead.reload.first_name).to eq("Updated")
    end

    it "does not allow a user to update another user's lead" do
      user = create(:user)
      other_user = create(:user)
      other_lead = create(:lead, user: other_user, first_name: "Original")
      sign_in user
      patch lead_path(other_lead), params: {
        lead: {
          first_name: "Hacked"
        }
      }
      expect(response).to have_http_status(:not_found)
      expect(other_lead.reload.first_name).to eq("Original")
    end
  end


  describe "DELETE /destroy" do
    it "allows a user to delete their own lead" do
      user = create(:user)
      lead = create(:lead, user: user)
      sign_in user
      expect {
        delete lead_path(lead)
      }.to change(Lead, :count).by(-1)
    end

    it "does not allow a user to delete another user's lead" do
      user = create(:user)
      other_user = create(:user)
      other_lead = create(:lead, user: other_user)
      sign_in user
      expect {
        delete lead_path(other_lead)
      }.not_to change(Lead, :count)
      expect(response).to have_http_status(:not_found)
    end
  end


  describe "POST /convert" do
    it "converts a lead into a client" do
      user = create(:user)
      lead = create(
        :lead,
        user: user,
        first_name: "John",
        last_name: "Doe",
        email: "john@example.com",
        phone: "123456789",
        company_name: "Test Company"
      )

      sign_in user

      expect {
        post convert_lead_path(lead)
      }.to change(Client, :count).by(1)
                                 .and change(Lead, :count).by(-1)

      client = Client.last

      expect(client.name).to eq("John Doe")
      expect(client.email).to eq("john@example.com")
      expect(client.phone).to eq("123456789")
      expect(client.company_name).to eq("Test Company")
      expect(client.status).to eq("active")
      expect(client.user).to eq(user)
    end
  end



end
