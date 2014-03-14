require 'features/features_helper'

feature "Add new idea", :js do
  before do
    log_me_in
  end

  let(:idea) { Idea.new(title: "Some title", description: "Some description") }
  before do
    visit('/')
    click_link 'Add New Idea'
    fill_in "idea[title]", with: idea.title
    fill_in "idea[description]", with: idea.description
    click_button 'Create Idea'
  end

  it { Idea.count.should > 0 }
  it { page.should have_content idea.title }
  it { page.should have_content idea.description }

  context "New idea page" do
    before do
      visit new_idea_path
    end

    it "has labels for entry fields" do
      page.should have_xpath "//label[@for='idea_title']"
      page.should have_xpath "//label[@for='idea_description']"
    end

    it "has a page title" do
      page.should have_css "h1", text: "New idea"
    end
  end
end

