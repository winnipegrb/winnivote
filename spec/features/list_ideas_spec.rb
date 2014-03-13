require 'features/features_helper'

feature "List proposed ideas in order to vote", :js do

  before do
    log_me_in
    @home = PageModels::Home.new
  end

  context "When there are no ideas to list" do

    before do
      @home.load
    end

    it "should not have ideas" do
      @home.idea_list.should_not have_idea_items
    end
  end

  context "When there are ideas to list" do
    
    let!(:expected) do
      FactoryGirl.create_list(:idea, 10).map do |idea| 
        idea_to_hash idea
      end
    end

    before do
      @home.load
    end

    subject do
      @home.idea_list.ideas
    end

    it "should have ideas" do
      expect(subject).to eq expected
    end
  end
end