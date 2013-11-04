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
  
end