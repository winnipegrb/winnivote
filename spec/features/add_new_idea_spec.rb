require 'features/features_helper'

feature "Add new idea", :js do
  before do
    log_me_in
  end

  let!(:project) { FactoryGirl.create(:project) }

  let(:idea) { build :idea, title: "Some title", description: "Some description" }

  before do
    visit('/')
    click_link 'Add New Idea'
    fill_in "idea[title]", with: idea.title
    fill_in "idea[description]", with: idea.description
  end

  context "with a project name" do
    before do
      select project.name, from: "idea_project_id"
      click_button 'Create Idea'
    end
    it { Idea.count.should > 0 }
    it { page.should have_content idea.title }
    it { page.should have_content idea.description }
    it { page.should have_content idea.project_name }
  end

  context "without a project name" do
    before do
      select "", from: "idea_project_id"
      click_button 'Create Idea'
    end
    it { Idea.count.should > 0 }
    it { page.should have_content idea.title }
    it { page.should have_content idea.description }
    it { page.should_not have_content project.name }
  end

end

