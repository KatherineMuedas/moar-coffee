source 'https://rubygems.org'
ruby '2.1.0'
gem 'rails', '4.1.5'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'devise'
gem 'foundation-rails', '5.4.3.0'
gem 'font-awesome-rails'
gem 'high_voltage' #static page generation
gem 'simple_form'
gem "paperclip", "~> 4.2"
gem 'friendly_id', '~> 5.0.0'
gem "geocoder"
gem "public_activity"
gem "figaro" #To protect secret keys
gem "aws-sdk"
gem 'asset_sync'
gem "acts_as_follower"
gem 'omniauth-facebook'
# gem 'rmagick', '2.13.2'
# gem 'haml-rails'
gem 'google_places'
gem 'mail_form'
gem "select2-rails"

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_21]
  gem 'meta_request' # for the rails panel chrome extension
  gem 'quiet_assets' 
  gem 'guard'
  gem 'guard-rails'
  gem 'guard-minitest'
  gem 'guard-bundler'
  gem 'guard-livereload'
  gem 'rack-livereload'
  gem 'ruby_gntp' # send notification when guard is running. download Growl from the app store.
  gem 'xray-rails' # short cut cmd + shift + x
end

group :development, :test do
  gem 'thin' # better webserver then webrick
  gem 'reek'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails' # rspec
end

group :test do
  gem 'minitest-rails'
  gem 'capybara' 
  gem 'database_cleaner'
  gem 'launchy' #no idea what this is. must be for rspec
  gem 'selenium-webdriver' # for capybara
  gem 'simplecov', require: false
end

group :production do
  gem 'rails_12factor' #for heroku
  gem 'unicorn'
end

gem 'sdoc', '~> 0.4.0',          group: :doc