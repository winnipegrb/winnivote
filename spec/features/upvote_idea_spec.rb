require 'features/features_helper'

feature "Upvoting an idea increases the votes", :js do

  let!(:ideas) { create_list(:idea, 10, :with_project) }

  before do
    log_me_in
  end
  
  scenario "Clicking on an upvote button" do
    visit "/"

    first(".upvote img").click

    expect(first(".total-votes")).to have_content "1"

  end

  scenario "Clicking upvote on an already upvoted idea" do
    visit "/"

    first(".upvote img").click
    first(".upvote img").click

    expect(first(".total-votes")).to have_content "1"

    expect(first(".idea-error")).to have_content "You have already voted on this idea!"
  end
end
