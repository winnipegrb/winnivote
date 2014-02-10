require 'features/features_helper'

feature "User Sign up", %q{
  As a User
  I want to sign up
  So I can login and start voting for ideas
}, :js do

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
      find( '.sign-in-footer' ).click_link( 'Sign in' )
      expect( current_path ).to eq new_user_session_path
    end
  end
  
  context "When the user signs up successfully" do
    before do
      fill_out_signup_form_and_submit email: "gannon@email.com", password: "asdf12345678", password_confirmation: "asdf12345678"
    end

    it "they end up on the home page of the site" do
      expect(current_path).to eq root_path
    end

    it "they get signed in, so a sign out link is present" do
      expect(page).to have_selector "a[href='#{destroy_user_session_path}']"
    end

    it "a confirmation notice is shown" do
      expect(page).to have_selector ".notification", text: "Welcome! You have signed up successfully."
    end
  end

  describe "Failure cases" do
    examples_of_handled_signup_failures = [
      {
        context: "When the required fields are not filled in",
        signup_inputs: {},
        expected_notifications: [ "Email can't be blank", "Password can't be blank" ]
      },
      {
        context: "When the password confirmation does not match the provided password",
        signup_inputs: { password: "asdf12345678", password_confirmation: "12345678asdf" },
        expected_notifications: [ "Password doesn't match confirmation" ]
      },
      {
        context: "When the password is too short",
        signup_inputs: { password: "1234567" },
        expected_notifications: [ "Password is too short (minimum is 8 characters)" ]
      },
      {
        context: "When the password is too long",
        signup_inputs: { password: a_password_that_is_130_chars_long = "12345678901234567890" * 13 },
        expected_notifications: [ "Password is too long (maximum is 128 characters)" ]
      },
    ]
    examples_of_handled_signup_failures.each do |example|
      context example[ :context ] do
        before do
          fill_out_signup_form_and_submit example[ :signup_inputs ]
        end
        example[ :expected_notifications ].each do |expected_notification_text|
          it 'the user is notified: "' + expected_notification_text + '"' do
            there_is_a_notification_on_the_page expected_notification_text
          end
        end
      end
    end

    context "When they provide an email address that is already signed up" do
        before do
          an_email_address_that_is_already_signed_up = FactoryGirl.create( :user, email: 'email@example.com' ).email
          fill_out_signup_form_and_submit email: an_email_address_that_is_already_signed_up 
        end
        it 'the user is notified: "Email has already been taken"' do
          there_is_a_notification_on_the_page "Email has already been taken"
        end
    end
  end
end
