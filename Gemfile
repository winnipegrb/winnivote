source 'https://rubygems.org'

gem 'rails', '3.2.14'
gem 'thin'

# gem 'mysql2'
gem 'sqlite3'
gem 'devise'

gem 'jquery-rails'
gem 'slim'
gem 'js-routes'

gem 'simple_form'

group :assets do
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass', '~> 3.1.0'
  gem 'knockoutjs-rails'
  gem 'font-awesome-sass'
end

group :debug do
  gem 'debugger', platforms: :ruby_19
end

group :development, :test do
  gem 'fuubar'
  gem "jasminerice", :git => 'https://github.com/bradphelan/jasminerice.git'
  gem 'guard-jasmine'
  gem 'rb-fchange', :require => false
  gem 'rb-fsevent', :require => RUBY_PLATFORM.include?('darwin') && 'rb-fsevent'
  gem 'rb-inotify', '~> 0.8.8', :require => RUBY_PLATFORM.include?('linux') && 'rb-inotify'
  gem 'growl-rspec', :require => RUBY_PLATFORM.include?('darwin') && 'growl-rspec'
  gem 'selenium-webdriver'
  gem 'rspec-rails'
end

group :test do
  gem 'database_cleaner'
  gem 'site_prism'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'capybara'
  gem 'poltergeist', :git => "https://github.com/jonleighton/poltergeist.git"
  gem 'factory_girl_rails'
  gem 'shoulda'
  gem 'capybara-screenshot'
  gem 'faker'
  gem 'rspec-given'
end

