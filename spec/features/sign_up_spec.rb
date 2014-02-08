require 'features/features_helper'

feature "Sign up", :js do
  def fill_out_signup_form_and_submit( input_values )
    visit new_user_registration_path
    input_values.each do |name, value|
      fill_in "user_" + name.to_s, with: value
    end

    click_button "Sign up"
  end

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
      expect(page).to have_selector "body p.notice", text: "Welcome! You have signed up successfully."
    end
  end

  describe "Failure cases" do
    def there_is_a_notification_on_the_page( text_of_the_notification )
      expect(page).to have_selector "#error_explanation li", text: text_of_the_notification
    end
    context "When the required fields are not filled in" do
      before do
        visit new_user_registration_path
        click_button "Sign up"
      end

      it "the user is notified that each of the required fields must be provided" do
        there_is_a_notification_on_the_page "Email can't be blank"
        there_is_a_notification_on_the_page "Password can't be blank"
      end
    end

    context "When the password confirmation does not match the provided password" do
      before do
        fill_out_signup_form_and_submit password: "asdf12345678", password_confirmation: "12345678asdf"
      end
      it "notifies the user" do
        there_is_a_notification_on_the_page "Password doesn't match confirmation"
      end
    end

    context "When the password is too short" do
      before do
        fill_out_signup_form_and_submit password: "1234567"
      end
      it "notifies the user" do
        there_is_a_notification_on_the_page "Password is too short (minimum is 8 characters)"
      end
    end

    context "When the password is too long" do
      before do
        a_password_that_is_130_chars_long = "12345678901234567890" * 13
        fill_out_signup_form_and_submit password: a_password_that_is_130_chars_long
      end
      it "notifies the user" do
        there_is_a_notification_on_the_page "Password is too long (maximum is 128 characters)"
      end
    end

    context "When they provide an email address that is already signed up" do
      before do
        user = FactoryGirl.create :user, email: 'email@example.com'
        fill_out_signup_form_and_submit email: user.email
      end
      it "notifies the user" do
        there_is_a_notification_on_the_page "Email has already been taken"
      end
    end
  end
end
