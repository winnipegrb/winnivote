require 'features/features_helper'

feature "Add new project", :js do
  before do
    log_me_in
  end

  let!(:project_count) { Project.count }
  let(:project) { build :project, name: "Some name" }

  before do
    @current_page = PageModels.landing_page
    @current_page.load
    @current_page.user_nav.create_project_link.click

    @current_page = PageModels::NewProject.new
    @current_page.project_form.fill_and_submit(project)
  end

  it { Project.count.should == project_count + 1 }
  it { page.should have_content "Project successfully created" }

end

