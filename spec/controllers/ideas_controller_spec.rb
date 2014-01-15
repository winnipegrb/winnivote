require 'spec_helper'

describe IdeasController do
  
  describe '#index' do
    before do
      @ideas = FactoryGirl.create_list :idea, 10
      get :index
    end
    it { should respond_with :success }
    it { should render_template(:index) }
    it { assigns(:ideas).should == @ideas }
  end

  describe '#new' do
    before do
      get :new
    end
    it { should respond_with :success }
    it { should render_template(:new) }
    it { assert assigns(:idea).new_record? }
  end

  describe '#create' do
    describe 'with valid params' do
      let(:idea_params) {{title: "Some title", description: "desc"}}
      before do
        @idea_count = Idea.count
        post :create, {idea: idea_params}
      end
      it { should redirect_to :root }
      it { Idea.last.title.should == idea_params[:title] }
      it { Idea.last.description.should == idea_params[:description] }
      it { Idea.count.should == @idea_count + 1 }
    end

    describe 'without valid params' do
      let(:invalid_idea_params) {{title: "", description: ""}}
      before do
        @idea_count = Idea.count
        post :create, {idea: invalid_idea_params}
      end
      it { should render_template(:new) }
      it { Idea.count.should == @idea_count }
    end
  end
  
end