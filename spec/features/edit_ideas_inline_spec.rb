require 'features/features_helper'

feature "Edit an idea inline with the list", :js do
  
  context "When there's some ideas"  do
    let!(:ideas) { FactoryGirl.create_list(:idea, 1) }
    
    before do
      visit('/')
    end

    it 'shows form fields when edit link clicked' do

      within('.idea') do
        click_link 'Edit'
        find_field 'idea_title'
        fill_in 'idea_title', with: 'New idea'
        fill_in 'idea_description', with: 'New idea description'
        click_on 'Save'
      end
    end    
    
  end
end