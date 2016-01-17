require 'rails_helper'

feature "user signs out",%Q{
  As the userI want to sign out
  so that I may protect my information
} do

  # Acceptance Criteria:
  # [] When I click the link "sign out" I am successfully  logged out of the system
  # [] If I am Signed Out I no longer have access to post either blogs or photographs

  scenario "An authenticated user successfully signs out" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "user_password", with: user.password
    click_button "Sign In"

    expect(page).to have_content("Welcome Back")
    expect(page).to have_content("Sign Out")

    click_link "Sign Out"

    expect(page).to have_content("Signed Out Successfully")
  end
end
