require 'features/features_helper'

feature "Edit an idea", %q{
  As a User
  I want to edit an idea
  So I can fix a typo
}, :js do

  let!(:ideas)   { FactoryGirl.create_list(:idea, 5) }
  let(:new_idea) { FactoryGirl.build :idea }
  
  before do
    log_me_in
    @current_page = PageModels.landing_page
    @current_page.load
    @current_page.change_idea ideas.first, new_idea
  end
  
  let(:expected) do 
    ideas.shift 
    ([new_idea] + ideas).map { |i| idea_to_hash i }
  end

  subject { @current_page.idea_list }
  
  it 'changes the idea on the page' do
    expect(subject.ideas).to eq expected
  end
  
  let(:stored_idea) { idea_to_hash(ideas.first.reload) }
  it 'changes the idea on the database' do
    expect(stored_idea).to eq idea_to_hash(new_idea)
  end
  
end