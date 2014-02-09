def confirm_these_possible_signup_failure_cases_are_handled( possible_failure_cases )
  possible_failure_cases.each do |possible_failure_case|
    context possible_failure_case[ :context ] do
      before do
        fill_out_signup_form_and_submit possible_failure_case[ :signup_inputs ]
      end
      possible_failure_case[ :expected_notifications ].each do |expected_notification_text|
        it 'the user is notified: "' + expected_notification_text + '"' do
          there_is_a_notification_on_the_page expected_notification_text
        end
      end
    end
  end
end

def fill_out_signup_form_and_submit( input_values )
  visit new_user_registration_path
  input_values.each do |name, value|
    fill_in "user_" + name.to_s, with: value
  end

  click_button "Sign up"
end

def there_is_a_notification_on_the_page( text_of_the_notification )
  expect(page).to have_selector "#error_explanation li", text: text_of_the_notification
end
