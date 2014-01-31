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
      visit(root_path)
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

feature "Access to ideas list", :js do
  
  context "When not logged in" do

    before do
      visit(root_path)
    end

    it "Checks if redirect was successful" do
      # check if redirected to sign in page
      current_path.should == new_user_session_path
      page.should have_selector("form#new_user")
    end

    it "Should have unauthenticated user nav" do
      # check if page has user nav and the right subelements
      page.should_not have_selector("nav.user ul li a", text: "Sign out")
      page.should have_selector("nav.user ul li a", text: "Sign up")
      page.should have_selector("nav.user ul li a", text: "Sign in")
    end

  end

  context "When logged in"  do

    before do
      login_as_user
      visit(root_path)
    end
    
    it "Checks user was not redirected" do
      # check if not redirected
      current_path.should == root_path
      page.should_not have_selector("form#new_user")
    end

    it "Should have authenticated user nav" do
      # check if page has user nav and the right subelements
      page.should have_selector("nav.user ul li a", text: "Sign out")
      page.should_not have_selector("nav.user ul li a", text: "Sign up")
      page.should_not have_selector("nav.user ul li a", text: "Sign in")
    end

  end
end
