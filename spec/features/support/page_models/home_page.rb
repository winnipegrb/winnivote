require 'features/support/page_models/sections'

module PageModels
  
  def self.landing_page
    Home.new
  end
  
  class Home < SitePrism::Page
    set_url "/"

    class Idea < SitePrism::Section
      element :vote_count, "div.votes"
      element :upvote_image, "div.upvote img"
      element :title, "h3.title"
      element :description, "div.description"
    end

    class IdeasList < SitePrism::Section
      element  :ideas_title, "h1", text: "Ideas"
      sections :idea_items, Idea, "ul li.idea"

      def ideas
        idea_items.map do |idea|
          { 
            title: idea.title.text, 
            description: idea.description.text,
          }
        end
      end
    end

    elements :notifications, "#notifications div.notification"
    section  :user_nav, UserNav, "#user_nav"
    section  :idea_list, IdeasList, "#ideas"
    
    def change_idea(old_idea, new_idea)
      within("#idea-#{old_idea.id}") do
        click_link 'Edit'
        fill_in 'idea_title', with: new_idea.title
        fill_in 'idea_description', with: new_idea.description
        click_on 'Save'
      end
    end
    
        
  end
end