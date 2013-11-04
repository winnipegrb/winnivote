require 'spec_helper'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'

Dir[Rails.root.join("spec/features/support/**/*.rb")].each { |f| require f } 


RSpec.configure do | config |

  config.include Rails.application.routes.url_helpers, :type => :feature
  config.include ActionView::Helpers::DateHelper
  config.include Capybara::DSL
  
end


