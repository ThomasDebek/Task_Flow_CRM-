require 'rails_helper'

RSpec.describe "Notes", type: :request do
  describe "POST /create" do
    it "creates a note for own client" do
      user = create(:user)
      client = create(:client, user: user)
      sign_in user
      expect {
        post client_notes_path(client), params: {
          note: {
            content: "Test note content"
          }
        }
      }.to change(Note, :count).by(1)
      expect(Note.last.client).to eq(client)
    end

    it "does not allow creating a note for another user's client" do
      user = create(:user)
      other_user = create(:user)
      other_client = create(:client, user: other_user)
      sign_in user
      expect {
        post client_notes_path(other_client), params: {
          note: {
            content: "Hacked note"
          }
        }
      }.not_to change(Note, :count)
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "DELETE /destroy" do
    it "deletes a note from own client" do
      user = create(:user)
      client = create(:client, user: user)
      note = create(:note, client: client)
      sign_in user
      expect {
        delete client_note_path(client, note)
      }.to change(Note, :count).by(-1)
    end
    it "does not allow deleting a note from another user's client" do
      user = create(:user)
      other_user = create(:user)
      other_client = create(:client, user: other_user)
      note = create(:note, client: other_client)
      sign_in user
      expect {
        delete client_note_path(other_client, note)
      }.not_to change(Note, :count)
      expect(response).to have_http_status(:not_found)
    end

  end
end
