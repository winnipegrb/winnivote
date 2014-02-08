module Signup
  def fill_out_signup_form_and_submit( input_values )
    visit_signup_page
    input_values.each do |name, value|
      fill_in "user_" + name.to_s, with: value
    end

    click_button "Sign up"
  end

  def there_is_a_notification_on_the_page( text_of_the_notification )
    expect(page).to have_selector "#error_explanation li", text: text_of_the_notification
  end

  def visit_signup_page
    visit new_user_registration_path
  end
end

RSpec.configure do |c|
  c.include Signup, type: :feature
end
