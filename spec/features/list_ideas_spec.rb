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
    before { @home.load }

    it "shows an empty ideas message" do
      expect(subject).to_not have_idea_items
    end
  end

  context "When there are ideas to list" do

    let!(:ideas)   { create_list(:idea, 10, :with_project) }
    let(:expected) { ideas.map &method(:idea_to_hash)      } 

    before {@home.load}

    subject {@home.idea_list.ideas}

    it "should list all the ideas" do
      expect(subject).to eq expected
    end
  end
end
