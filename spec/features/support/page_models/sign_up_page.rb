require 'features/support/page_models/sections'

module PageModels
  class SignUp < SitePrism::Page
  	set_url "/users/sign_up"

  	elements :notifications, "#notifications div.notification"
  	section :user_nav, UserNav, "#user_nav"
  	section :sign_up_form, AuthenticationForm, "#new_user"
  end
end