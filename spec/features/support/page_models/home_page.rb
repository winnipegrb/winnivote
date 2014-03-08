require 'features/support/page_models/sections'

module PageModels
  class Home < SitePrism::Page
    set_url "/"

    elements :notifications, "#notifications div.notification"
    section :user_nav, UserNav, "#user_nav"
    section :idea_list, IdeasList, "#ideas"
  end
end