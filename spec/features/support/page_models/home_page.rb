require 'features/support/page_models/sections'

module PageModels

  def self.landing_page
    Home.new
  end

  class Home < SitePrism::Page
    set_url "/"

    elements :notifications, "#notifications div.notification"
    section  :user_nav, UserNav, "#user_nav"
    section  :idea_list, IdeasList, "#ideas"

    def change_idea(old_idea, new_idea)
      within("#idea-#{old_idea.id}") do
        click_button 'Edit'
        fill_in 'idea_title', with: new_idea.title
        fill_in 'idea_description', with: new_idea.description
        click_on 'Save'
      end

      find("#idea-#{old_idea.id} .idea-content") # block until finished
    end

  end
end
