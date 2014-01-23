require 'spec_helper'

describe IdeasController do
  
  describe '#index' do
    before do
      @ideas = FactoryGirl.create_list :idea, 10
      controller.stub(:authenticate_user!)
      get :index
    end
    it { should respond_with :success }
    it { should render_template(:index) }
    it { assigns(:ideas).should == @ideas }
  end

  describe 'PUT #upvote' do
    let(:idea) { FactoryGirl.create(:idea) }

    before do
      Idea.stub(find: idea)
      put :upvote, id: idea.to_param, format: :json
    end

    it "increases the votes of the idea by one" do
      expect(idea.votes).to eq 1
    end
    
    it "stores the increased votes value" do
      expect(Idea.find(idea.id).votes).to eq 1
    end

    it "returns json containing the number of votes" do
      expect(response.body).to eq({votes: 1}.to_json)
    end
  end
end
