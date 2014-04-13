require 'spec_helper'

describe ProjectsController do 

    context "When user is not signed in" do 

        describe "#new" do 
            before { get :new }

            it { should redirect_to new_user_session_url }
        end

        describe "#create" do
            let(:project_params) {{name: "Some name"}}

            before { post :create, {project: project_params} }

            it { should redirect_to new_user_session_url }
        end
    end

    context "When user is signed in" do 

        before do 
            @user = FactoryGirl.create :user
            sign_in @user
        end

        describe "#new" do 
            before { get :new }

            it { should respond_with :success }
            it { should render_template(:new) }
            it { assert assigns(:project).new_record? }
        end

        describe "#create" do 
            let(:project_params) {{name: "Some name"}}

            before { post :create, {project: project_params} }

            it { should redirect_to :root }
            it { Project.last.name.should == project_params[:name] }
        end
    end
end
