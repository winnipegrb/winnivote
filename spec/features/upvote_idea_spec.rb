require 'features/features_helper'

feature "Upvoting ideas", :js do

  describe "Clicking an upvote button" do

    let!(:ideas) { create_list(:idea, 10, :with_project) }

    context "When the user is logged in" do

      before do
        log_me_in
      end
      
      scenario "increases number of votes of the upvoted idea" do
        visit "/"

        first(".upvote img").click

        expect(first(".votes")).to have_content "1"

        first(".upvote img").click

        expect(first(".votes")).to have_content "2"

      end
    end

    context "When the user is NOT logged in" do

      scenario "redirects user to sign-in page" do
        visit "/"

        first(".upvote img").click

        # Wait for the page redirect to happen
        page.should have_selector("form#new_user")

        current_path.should == new_user_session_path

      end
    end
  end 
end
