require 'features/features_helper'

feature "List proposed ideas in order to vote", :js do
  
  before do
    log_me_in
  end

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
      visit(root_path)
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

feature "List proposed ideas in order to vote (SitePrism)", :js do
  before do
    log_me_in
    @home = PageModels::Home.new
  end

  context "When there are no ideas to list" do
    before do
      @home.load
    end

    it "should not have ideas" do
      @home.should have_idea_list
      @home.idea_list.should_not have_ideas
    end

  end

  context "When there are ideas to list" do

    before do
      FactoryGirl.create_list(:idea, 12)
      @home.load
    end

    it "should have ideas" do
      @home.should have_idea_list
      @home.idea_list.should have_ideas count: 12
    end
    
  end
  
end
