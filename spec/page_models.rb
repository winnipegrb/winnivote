require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'site_prism'

#Test Page Models
module PageModels

	#Sections
  
  class UserNav < SitePrism::Section
    element :winnivote_link, ""
    element :sign_in_link, ""
    element :sign_up_link, ""
  end

  class AuthenticationForm < SitePrism::Section
    element :email_field, ""
    element :password_field, ""
    element :password_confirmation_field, ""
    element :remember_me_checkbox, ""
    element :sign_in_button, ""
    element :sign_up_button, ""
    element :sign_in_link, ""
    element :sign_up_link, ""
    element :forgot_password_link, ""
  end

  class IdeasList < SitePrism::Section
    element :idea_list, ""
    element :add_idea_link, ""
  end

  #Pages
	
  class Home < SitePrism::Page
    set_url "/"

    elements :notifications, "#notifications div.notification"
    section :user_nav, UserNav, "#user_nav"
    section :ideas, IdeasList, "#ideas"
  end

  class SignIn < SitePrism::Page
  	set_url "/users/sign_in"

  	elements :notifications, "#notifications div.notification"
  	section :user_nav, UserNav, "#user_nav"
  	section :sign_in_form, AuthenticationForm, "#new_user"
  end

  class SignUp < SitePrism::Page
  	set_url "/users/sign_up"

  	elements :notifications, "#notifications div.notification"
  	section :user_nav, UserNav, "#user_nav"
  	section :sign_up_form, AuthenticationForm, "#new_user"
  end
  
end
