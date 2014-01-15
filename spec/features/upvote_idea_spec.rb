require 'features/features_helper'

feature "Upvoting an idea increases the votes", :js do
  let!(:ideas) { FactoryGirl.create_list(:idea, 10) }

  scenario "Clicking on an upvote button" do
    visit "/"

    first(".upvote img").click

    expect(first(".votes")).to have_content "1"

    first(".upvote img").click

    expect(first(".votes")).to have_content "2"

  end
end
