require "rails_helper"

RSpec.describe "Delete note", type: :system do
  before do
    driven_by(:selenium, using: :headless_chrome)
  end

  let(:user) { create(:user) }
  let(:client) { create(:client, user: user) }
  let!(:note) do
    create(
      :note,
      client: client,
      content: "Note to delete"
    )
  end

  before do
    login_as_user(user)
  end

  it "deletes a note" do
    visit client_path(client)

    expect(page).to have_content("Note to delete")

    accept_confirm do
      click_link "Delete", href: client_note_path(client, note)
    end

    expect(page).not_to have_content("Note to delete")
    expect(Note.exists?(note.id)).to be false
  end
end