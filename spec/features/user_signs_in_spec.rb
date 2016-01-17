require "rails_helper"

feature "user signs in", %Q{
  As the user
  I want to sign in
  So that I may post a blog
} do

  # Acceptance Criteria:
  # [] If I specify a valid, previously registered email and password,
  #    I am authenticated and I gain access to the system
  # [] If I specify an invalid email and password, I remain unauthenticated
  # [] If I am already signed in, I can't sign in again

  scenario "an existing user specifies a valid email and password" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "user_password", with: user.password
    click_button "Sign In"

    expect(page).to have_content("Welcome Back")
    expect(page).to have_content("Sign Out")
  end

  scenario "a nonexistant email and password provided" do
    visit new_user_session_path

    fill_in "Email", with: "something@example.com"
    fill_in "user_password", with: "password"
    click_button "Sign In"

    expect(page).to have_content("Invalid email")
    expect(page).to_not have_content("Welcome Back")
    expect(page).to_not have_content("Sign Out")
  end

  scenario "an existing email with wrong password is denied" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "incorect_password"
    click_button "Sign In"

    expect(page).to have_content("Invalid email")
    expect(page).to_not have_content("Welcome Back")
    expect(page).to_not have_content("Sign Out")
  end

  scenario "an already authenticated user cannot resign in" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"

    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign In")

    visit new_user_session_path
    expect(page).to have_content("You are already signed in")
  end

end
