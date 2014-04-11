require 'features/support/page_models/application_page'

module PageModels

  def self.landing_page
    Home.new
  end

  class Home < ApplicationPage
    set_url "/"

    class Idea < SitePrism::Section
      element :vote_count  , ".votes"
      element :upvote_image, ".upvote img"
      element :title       , "h3.title"
      element :description , ".description"
      element :project     , ".project"
      element :edit_button , ".edit"
    end

    class IdeasList < SitePrism::Section
      element  :ideas_title, "h1", text: "Ideas"
      sections :idea_items, Idea, "ul li.idea"

      def ideas
        idea_items.map do |idea|
          { 
            title: idea.title.text, 
            description: idea.description.text,
            project: idea.project.text
          }
        end
      end

      def read_only?
        !(idea_items.map { |idea| idea.has_edit_button? }.include? true)
      end
    end

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
