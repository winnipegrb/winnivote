require 'features/features_helper'

feature "Edit an idea", %q{
  As a User
  I want to edit an idea
  So I can fix a typo
}, :js do

  let(:project)  { create :project }
  let!(:ideas)   { create_list(:idea, 5, project: project) }
  let(:new_idea) { build :idea, project: project }
  
  before do
    log_me_in
    @current_page = PageModels.landing_page
    @current_page.load
    @current_page.change_idea ideas.first, new_idea
  end
  
  let(:expected) do 
    ideas.shift 
    ([new_idea] + ideas).map &method(:idea_to_hash)
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