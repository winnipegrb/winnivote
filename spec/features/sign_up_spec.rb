require 'features/features_helper'

feature "User Sign up", %q{
  As a User
  I want to sign up
  So I can login and start voting for ideas
}, :js do
  
  context "When the visitor is not registered" do

    before do
      visit(new_user_registration_path)
      # sign up form fill out with capybara

      # fill out form and submit
      fill_in "user_email", with: "gannon@email.com"
      fill_in "user_password", with: "asdf12345678"
      fill_in "user_password_confirmation", with: "asdf12345678"
      click_button "Sign up"
    end

    it "Shows the sing up confirmation message" do
      expect(page).to have_selector(".notification", text: "Welcome! You have signed up successfully.")
    end

    it "shows the sign out option on the menu" do
      expect(page).to have_selector("nav.user ul li a", text: "Sign out")
    end
    
  end
end
