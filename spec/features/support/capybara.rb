require 'capybara/rspec'
require 'capybara/poltergeist'
require 'selenium-webdriver'
require 'capybara-screenshot/rspec'

Capybara.javascript_driver = ENV['JS_DRIVER'] == "selenium" ? :selenium : :poltergeist

Capybara.default_driver = :selenium if ENV['JS_DRIVER'] == "selenium"

Capybara.register_driver :poltergeist do |app|
  # inspector:true enables poltergeist debugging with page.driver.debug
  Capybara::Poltergeist::Driver.new(app, inspector: true)
end

Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
    
	Capybara::Selenium::Driver.new(app, {:browser => :firefox, 
	                                     :profile => ENV['DEFAULT_PROFILE'] ? 'default' : profile } )
end

# Capybara defaults to XPath selectors rather than Webrat's default of CSS3. In
# order to ease the transition to Capybara we set the default here. If you'd
# prefer to use XPath just remove this line and adjust any selectors in your
# steps to use the XPath syntax.
Capybara.default_selector = :css
Capybara.ignore_hidden_elements = true
