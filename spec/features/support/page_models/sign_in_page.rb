require 'features/support/page_models/sections'

module PageModels
  class SignIn < SitePrism::Page
  	set_url "/users/sign_in"

  	elements :notifications, "#notifications div.notification"
  	section :user_nav, UserNav, "#user_nav"
  	section :sign_in_form, AuthenticationForm, "#new_user"
  end
end