require 'features/features_helper'

feature "Sign in", :js do
  
  context "When not logged in" do

    before do
      visit(root_path)
      click_link "Sign in"
    end

    it "Should be on sign in page and have sign in form" do
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
      log_me_in
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
