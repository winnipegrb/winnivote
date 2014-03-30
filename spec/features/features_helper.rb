require 'spec_helper'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'factory_girl_rails'
require 'site_prism'

Dir[Rails.root.join("spec/features/support/**/*.rb")].sort.each { |f| require f } 

RSpec.configure do | config |

  config.include Rails.application.routes.url_helpers, :type => :feature
  config.include ActionView::Helpers::DateHelper
  config.include Warden::Test::Helpers
  config.include Capybara::DSL
  config.include LoginHelpers, :type => :feature
  config.include IdeaHelpers, :type => :feature
  config.include PageModels, :type => :feature
  
  if ENV['DEBUG_COMBO']
    ENV['JS_DRIVER'] = 'selenium' 
    ENV['WAIT_FOR_ME'] = 'true' 
    ENV['DEFAULT_PROFILE'] = 'true'
  end
  
  config.before(:suite) do
    Capybara.javascript_driver = ENV['JS_DRIVER'] == "selenium" ? :selenium : :poltergeist
  end
  
  config.after do
    $stdin.getc if ENV['WAIT_FOR_ME']
  end
  
  
end


