require 'features/features_helper'

feature "List available ideas", %q{
  As a User
  I want to see the list of ideas
  So I can vote for the ones I like better
}, :js do

  before do
    log_me_in
    @home = PageModels::Home.new
  end

  subject { @home.idea_list }

  context "When there are no ideas to list" do
    Given do 
      # no ideas are stored
    end
    
    When { @home.load }
    
    Then { expect(subject).to_not have_idea_items }
  end

  context "When there are ideas to list" do
    let(:stored_ideas) { ideas.map &method(:idea_to_hash) }

    Given!(:ideas) do
      FactoryGirl.create_list(:idea, 10, :with_project)
    end
    
    When { @home.load }

    Then { expect(subject.ideas).to eq stored_ideas }
  end
end
