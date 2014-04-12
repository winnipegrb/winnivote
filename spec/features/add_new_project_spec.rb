require 'features/features_helper'

feature "Add new project", :js do
  before do
    log_me_in
  end

  let!(:project_count) { Project.count }
  let(:project) { build :project, name: "Some name" }

  before do
    visit('/')
    click_link 'Create project'
    fill_in "project[name]", with: project.name
    click_button 'Create Project'
  end

  it { Project.count.should == project_count + 1 }

end

