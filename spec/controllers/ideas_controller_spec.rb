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

  describe 'put #upvote' do
    let(:idea) { FactoryGirl.create(:idea) }

    before do
      Idea.stub(find: idea)
    end

    it "tells the idea to upvote itself" do
      idea.should_receive(:upvote!)

      put :upvote, id: idea.to_param, format: :json
    end

    it "returns json containing the number of votes" do
      put :upvote, id: idea.to_param, format: :json

      expect(response.body).to eq({votes: 1}.to_json)
    end
  end
end
