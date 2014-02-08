require 'features/features_helper'

feature "Sign up", :js do

  context "The sign up page" do
    before do
      visit new_user_registration_path
    end

    it "has a form with email address, password, and password confirmation fields" do
      [ 'email', 'password', 'password_confirmation' ].each do |field_name|
        expect(page).to have_selector "input#user_" + field_name
      end
    end

    it "has a link to the sign in page, for people who already have an account" do
      expect(page).to have_selector "a[href='#{new_user_session_path}']"
    end
  end
  
  context "When the user signs up successfully" do
    def fill_out_signup_form_and_submit
      fill_in "user_email", with: "gannon@email.com"
      fill_in "user_password", with: "asdf12345678"
      fill_in "user_password_confirmation", with: "asdf12345678"
      click_button "Sign up"
    end

    before do
      visit new_user_registration_path
      fill_out_signup_form_and_submit
    end

    it "they end up on the home page of the site" do
      expect(current_path).to eq root_path
    end

    it "they get signed in, so a sign out link is present" do
      expect(page).to have_selector "a[href='#{destroy_user_session_path}']"
    end

    it "a confirmation notice is shown" do
      expect(page).to have_selector "body p.notice", text: "Welcome! You have signed up successfully."
    end
  end

  describe "Failure cases" do
    context "When one or more of the required fields are not filled in" do
      before do
        visit new_user_registration_path
        click_button "Sign up"
      end

      context "Missing email address" do
        it "the user is notified that the email address is required" do
          expect(page).to have_selector "#error_explanation li", text: "Email can't be blank"
        end
      end
    end
  end
end
