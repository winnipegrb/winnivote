require 'site_prism'

#Test Page Models
module PageModels

	#Sections
  
  class UserNav < SitePrism::Section
    element :winnivote_link, "a.navbar-brand", text: "Winnivote"
    element :sign_in_link,   "ul.nav li a", text: "Sign In"
    element :sign_up_link,   "ul.nav li a", text: "Sign Up"
    element :sign_out_link,  "ul.nav li a", text: "Sign Out"
  end

  class AuthenticationForm < SitePrism::Section
    element :email_field, "#user_email"
    element :password_field, "#user_password"
    element :password_confirmation_field, "#user_password_confirmation"
    element :remember_me_checkbox, "#user_remember_me"
    element :sign_in_button, "input[name='commit'][value='Sign In']"
    element :sign_up_button, "input[name='commit'][value='Sign Up']"
    # Out of scope, to be fixed
    # element :sign_in_link, ""
    # element :sign_up_link, ""
    # element :forgot_password_link, ""
  end

  class Idea < SitePrism::Section
    element :vote_count, "div.votes"
    element :upvote_image, "div.upvote img"
    element :title, "h3.title"
    element :description, "div.description"
  end
  
  class IdeasList < SitePrism::Section
    element :ideas_title, "h1", text: "Ideas"
    sections :ideas, Idea, "ul li.idea"
  end

  #Pages
	
  class Home < SitePrism::Page
    set_url "/"

    elements :notifications, "#notifications div.notification"
    section :user_nav, UserNav, "#user_nav"
    section :idea_list, IdeasList, "#ideas"
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
