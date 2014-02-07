require 'features/features_helper'

feature "Sign up", :js do
  
  context "When signing up" do

    before do
      visit(new_user_registration_path)
      # sign up form fill out with capybara

      # fill out form and submit
      fill_in "user_email", with: "gannon@email.com"
      fill_in "user_password", with: "asdf12345678"
      fill_in "user_password_confirmation", with: "asdf12345678"
      click_button "Sign up"
    end

    it "Should flash success and log in" do
      page.should have_selector("body p.notice", text: "Welcome! You have signed up successfully.")
      page.should have_selector("nav.user ul li a", text: "Sign out")
    end

  end
end
