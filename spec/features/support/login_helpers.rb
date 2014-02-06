module LoginHelpers
  extend Warden::Test::Helpers
  
  def log_me_in
    user = FactoryGirl.create(:user)
    login_as user, scope: :user
    user
  end
  
end