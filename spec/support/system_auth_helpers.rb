module SystemAuthHelpers
  def login_as_user(user)
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "password123"

    click_button "Log in"

    expect(page).to have_content("Signed in successfully")
  end
end