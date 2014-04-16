class ApplicationPage < SitePrism::Page

  class UserNav < SitePrism::Section
    element :winnivote_link, "a.navbar-brand", text: "Winnivote"
    element :create_project_link, "ul.nav li a", text: "Create project"
    element :sign_in_link  , "ul.nav li a", text: "Sign In"
    element :sign_up_link  , "ul.nav li a", text: "Sign Up"
    element :sign_out_link , "ul.nav li a", text: "Sign Out"
  end

  elements :notifications, "#notifications div.notification"
  section  :user_nav, UserNav, "#user_nav"
end

