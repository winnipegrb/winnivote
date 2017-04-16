require 'features/features_helper'

feature "Upvoting an idea increases the votes", :js do

  let!(:ideas) { create_list(:idea, 10, :with_project) }

  before do
    log_me_in
    @current_page = PageModels.landing_page
    @current_page.load
  end
  
  subject { @current_page.idea_list.idea_items.first }

  scenario "Clicking on an upvote button" do

    subject.upvote_image.click
    expect(subject.vote_count).to have_content "1"
    subject.upvote_image.click
    expect(subject.vote_count).to have_content "2"
    
  end
end
