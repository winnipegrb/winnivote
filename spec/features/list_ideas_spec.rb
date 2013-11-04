require 'features/features_helper'

feature "List proposed ideas in order to vote", :js do
  
  before do
    visit('/')
  end
  
  context "When there's some ideas" do
    before do
      @ideas = all(:css, '.idea').map do |idea|
        {
          title: idea.find(:css, '.title').text,
          description: idea.find(:css, '.description').text,
        }
      end
    end
    
    subject { @ideas }
    
    it { should == [{title: 'Idea1', description: 'Very nice idea'}]}
  end
  
  context "When no ideas have been posted yet" do
  end
end

