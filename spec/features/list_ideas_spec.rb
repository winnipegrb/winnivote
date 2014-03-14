require 'features/features_helper'

feature "List proposed ideas in order to vote", :js do

  before do
    log_me_in
    @home = PageModels::Home.new
  end

  subject { @home.idea_list }

  context "When there are no ideas to list" do
    before { @home.load }
    it "should not have ideas" do
      expect(subject).to_not have_idea_items
    end
  end
  
  context "When there are some ideas"  do
    let!(:ideas)   { FactoryGirl.create_list(:idea, 10) }    
    let(:expected) { ideas.map { |i| idea_to_hash i }   }

    before { @home.load }

    it "should have ideas" do
      expect(subject.ideas).to eq expected
    end
  end
end
