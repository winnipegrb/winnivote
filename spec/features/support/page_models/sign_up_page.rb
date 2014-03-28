require 'features/support/page_models/application_page'

module PageModels
  class SignUp < ApplicationPage
  	set_url "/users/sign_up"

  	section :sign_up_form, AuthenticationForm, "#new_user"
  end
end