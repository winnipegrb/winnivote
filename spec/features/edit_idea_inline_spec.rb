require 'features/features_helper'

feature "Edit an idea", %q{
  As a User
  I want to edit an idea
  So I can fix a typo
}, :js do

  let!(:ideas)   { FactoryGirl.create_list(:idea, 1) }
  let(:new_idea) { FactoryGirl.build :idea }
  
  def change_idea(old_idea, new_idea)
    within("#idea-#{old_idea.id}") do
      click_link 'Edit'
      fill_in 'idea_title', with: new_idea.title
      fill_in 'idea_description', with: new_idea.description
      click_on 'Save'
    end
  end
  
  before do
    log_me_in
    visit('/')
    change_idea ideas.first, new_idea
  end
  
  it 'changes the idea on the page' do
    expect(page).to have_content new_idea.title
    expect(page).to have_content new_idea.description
  end
  
  it 'changes the idea on the database' do
  end
  
end