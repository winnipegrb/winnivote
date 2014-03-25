require 'features/support/page_models/application_page'

module PageModels
  class SignIn < ApplicationPage
  	set_url "/users/sign_in"

  	section :sign_in_form, AuthenticationForm, "#new_user"
  end
end