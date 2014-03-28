module PageModels
  
  class AuthenticationForm < SitePrism::Section
    element :email_field   , "#user_email"
    element :password_field, "#user_password"
    element :password_confirmation_field, "#user_password_confirmation"
    element :remember_me_checkbox, "#user_remember_me"
    element :sign_in_button, "input[name='commit'][value='Sign In']"
    element :sign_up_button, "input[name='commit'][value='Sign Up']"
  end

end
