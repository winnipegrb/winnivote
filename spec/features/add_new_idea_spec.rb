require 'features/features_helper'

feature "Add new idea", :js, :focus do
  let(:params) {{ title: "Some title", description: "Some description" }}
  before do
    visit('/')
    click_link 'Add New Idea'
    fill_in "idea[title]", with: params[:title]
    fill_in "idea[description]", with: params[:description]
    click_button 'Create Idea'
  end

  it { Idea.count.should > 0 }

end

