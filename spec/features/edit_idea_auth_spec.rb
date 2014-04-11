require 'features/features_helper'

feature "Edit an idea", :js do 

    let(:project)  { create :project }
    let!(:ideas) { create_list(:idea, 5, project: project) }

    context "When a user is not signed in" do

        before do 
            @current_page = PageModels.landing_page
            @current_page.load
        end
        
        it 'does not let you edit ideas' do
            expect(@current_page.idea_list.read_only?).to be_true
        end
    end

    context "When a user is signed in" do

        before do
            log_me_in
            @current_page = PageModels.landing_page
            @current_page.load
        end

        it 'lets you edit ideas' do
            expect(@current_page.idea_list.read_only?).to be_false
        end
    end
end