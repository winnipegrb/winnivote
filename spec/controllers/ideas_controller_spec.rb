require 'spec_helper'

describe IdeasController do
  
  context "When user is not signed in" do

    describe '#index' do
      before do
        @ideas = FactoryGirl.create_list :idea, 10
        get :index
      end
      it { should respond_with :success }
      it { should render_template(:index) }
      it { assigns(:ideas).should == @ideas }
    end

    describe "PUT #upvote" do
      before {put :upvote, id: 5, format: :json}

      it "responds with unauthorized status" do
        expect(response.status).to eq 401
      end
    end

    describe "#new" do
      before { get :new }

      it { should redirect_to new_user_session_url }
    end

    describe "#create" do
      let(:idea_params) {{title: "title", description: "desc"}}

      before { post :create, {idea: idea_params} }

      it { should redirect_to new_user_session_url }
      it { Idea.count.should == 0 }
    end

  end

  context "When user is signed in" do 
   
    before :each do
      @user = FactoryGirl.create :user
      sign_in @user
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
      let!(:idea_count) { Idea.count }
      
      describe 'with valid params' do
        let(:idea_params) {{title: "Some title", description: "desc"}}

        before do
          post :create, {idea: idea_params}
        end
        it { should redirect_to :root }
        it { Idea.last.title.should == idea_params[:title] }
        it { Idea.last.description.should == idea_params[:description] }
        it { Idea.count.should == idea_count + 1 }
      end

      describe 'without valid params' do
        let(:invalid_idea_params) {{title: "", description: ""}}

        before do
          post :create, {idea: invalid_idea_params}
        end
        it { should render_template(:new) }
        it { Idea.count.should == idea_count }
      end
    end

    describe 'PUT #upvote' do
      let(:idea) { FactoryGirl.create(:idea) }

      before do
        put :upvote, id: idea.to_param, format: :json
      end

      it "increases the votes of the idea by one" do
        expect(idea.reload.votes).to eq 1
      end

      it "returns json containing the number of votes" do
        expect(response.body).to eq({votes: 1}.to_json)
      end
    end
    
    describe '#update' do
      let!(:ideas) { FactoryGirl.create_list :idea, 10 }
      let(:idea)   { ideas.first }
      let(:attr)   { { title:'Updated title', description:'Updated description' } }

      context "when the request is html" do
        before { put :update, id: idea.id, idea: attr }
        it { should respond_with :not_acceptable   }
      end
    
      context "when the request is JSON" do
        before {put :update, :format => :json, id: idea.id, idea: attr}

        it { should respond_with :no_content }

        it "updates the idea on the database" do
          idea.reload
          expect(idea.title).to eq attr[:title]
          expect(idea.description).to eq attr[:description]
        end
      end
    end
  end

end
