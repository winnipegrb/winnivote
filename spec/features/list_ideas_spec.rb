require 'features/features_helper'

feature "List proposed ideas in order to vote", :js do
  
  context "When there's some ideas"  do
    let(:ideas) { FactoryGirl.create_list(:idea, 10) }
    
    let!(:expected) do
      ideas.map do |i| 
        {
          title: i.title,
          description: i.description
        }
      end
    end
    
    before do
      visit('/')
    end
    
    subject do
      all(:css, '.idea').map do |idea|
        {
         title: idea.find(:css, '.title').text,
         description: idea.find(:css, '.description').text,
        }
      end
    end      
    
    it { should =~ expected }
  end
end

