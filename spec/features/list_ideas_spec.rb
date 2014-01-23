require 'features/features_helper'

feature "List proposed ideas in order to vote", :js do
  
  context "When there's some ideas"  do
    let(:ideas) { FactoryGirl.create_list(:idea, 10) }
    
    let!(:expected) do
      ideas.map do |i| 
        {
          title: i.title,
          description: i.description
        }
      end
    end
    
    before do
      login_as_user
      visit('/')
    end
    
    subject do
      all(:css, '.idea').map do |idea|
        {
         title: idea.find(:css, '.title').text,
         description: idea.find(:css, '.description').text,
        }
      end
    end      
    
    it { should =~ expected }
  end
end

feature "Access to ideas list", :js, :ignore do
  
  context "When not logged in"  do

    before do
      visit('/')
    end

    it "Checks if redirect was successful" do
      # check if redirected to sign in page
      # expect(@response).to redirect_to(user_registration_path)
      assert_redirected_to user_registration_path
      # response.code.should == "302"
      # response.should redirect_to(user_registration_path)
    end

  end

  context "When logged in"  do

    before do
      visit('/')
      login_as_user
    end
    
    # check if not redirected

  end
end
