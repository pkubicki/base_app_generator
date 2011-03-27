run 'rm Gemfile'
create_file 'Gemfile', "source 'http://rubygems.org'\n"
gem "rails", "~> 3.0.0"
gem 'mysql', "~> 2.8.1"
gem "haml", "~> 3.0.25"
gem "haml-rails", "~> 0.3.4"
gem "jquery-rails", "~> 0.2"
gem "responders", "~> 0.6.2"
gem "yamled_acl", "~> 0.2.0"
gem 'authlogic', :git => 'http://github.com/odorcicd/authlogic.git', :branch => 'rails3'
gem 'will_paginate', :git => 'http://github.com/mislav/will_paginate.git', :branch => 'rails3'
gem 'meta_search', "~> 1.0.1"
gem 'capistrano', "~> 2.5.19", :group => :development
gem 'capistrano-recipes', "~> 0.5.0", :group => :development
gem 'rails3-generators', "~> 0.17.4", :group => :development
gem 'rspec-rails', "~> 2.5.0", :group => :test
gem "rcov", "~> 0.9.9", :group => :test
gem "fuubar", :group => :test
gem 'factory_girl', "~> 1.3.3", :group => :test
gem 'factory_girl_rails', "~> 1.0.1", :group => :test
gem 'capybara', "~> 0.4.1", :group => :cucumber
gem 'database_cleaner', "~> 0.6.4", :group => :cucumber
gem 'cucumber', "~> 0.10.0", :group => :cucumber
gem 'cucumber-rails', "~> 0.3.2", :group => :cucumber
gem 'launchy', "~> 0.3.7", :group => :cucumber
gem 'pickle', "~> 0.4.4", :group => :cucumber
gem "spork", "~> 0.8.4", :group => :cucumber
run 'bundle install'

generate 'jquery:install'
generate 'rspec:install'
generate 'cucumber:install --capybara --rspec --spork'
generate 'pickle --path --email'

run 'rm .gitignore'
run 'rm app/controllers/application_controller.rb'
run 'rm app/helpers/application_helper.rb'
run 'rm config/application.rb'
run 'rm config/routes.rb'
run 'rm config/database.yml'
run 'rm db/seeds.rb'
run 'rm public/index.html'
run 'rm .rspec'
run 'rm spec/spec_helper.rb'
run 'rm features/support/paths.rb'

