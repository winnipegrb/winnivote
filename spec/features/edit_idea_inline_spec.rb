require 'features/features_helper'

feature "Edit an idea inline", :js do
  
  context "when there's some ideas"  do
    let!(:ideas) { FactoryGirl.create_list(:idea, 1) }
    
    before do
      log_me_in
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
    
    it 'update record after save button clicked' do
      within('.idea') do
        click_link 'Edit'
        find_field 'idea_title'
        fill_in 'idea_title', with: 'Newer title'
        fill_in 'idea_description', with: 'Newer idea description'
        click_on 'Save'
        expect(page).to have_content('Newer title')
        expect(page).to have_content('Newer idea description')
      end
    end
  end
end