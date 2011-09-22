run 'rm Gemfile'
create_file 'Gemfile', "source 'http://rubygems.org'\n"
gem "rails", "~> 3.1.0"
gem "mysql2", "~> 0.3"
gem "haml-rails", "~> 0.3"
gem "jquery-rails", "~> 1.0"
gem "responders", "~> 0.6"
gem "yamled_acl", "~> 0.2"
gem "authlogic", "~> 3.0"
gem "will_paginate", "~> 3.0"
gem "meta_search", "~> 1.1"
gem 'sass-rails', " ~> 3.1"  , :group => :assets
gem 'coffee-rails', " ~> 3.1", :group => :assets
gem 'uglifier', :group => :assets
gem "yui-compressor", "~> 0.9", :group => :production
gem "capistrano", "= 2.5.20", :group => :development
gem "capistrano-recipes", "= 0.5", :group => :development
gem "rails3-generators", "~> 0.17", :group => :development
gem "rspec-rails", "~> 2.6", :group => :test
gem "rcov_rails", "~> 0.3", :group => :test
gem "fuubar", :group => :test
gem "factory_girl_rails", "~> 1.2", :group => :test
gem "database_cleaner", "~> 0.6", :group => :cucumber
gem "cucumber-rails", "~> 1.0", :group => :cucumber
gem "launchy", "~> 2.0", :group => :cucumber
gem "pickle", "~> 0.4", :group => :cucumber
gem "spork", "~> 0.8", :group => :cucumber
run 'bundle install'

generate 'rspec:install'
generate 'cucumber:install --capybara --rspec --spork'
generate 'pickle --path --email'

run 'rm .gitignore'
run 'rm app/assets/images/rails.png'
run 'rm app/assets/stylesheets/application.css'
run 'rm app/assets/javascripts/application.js'
run 'rm app/controllers/application_controller.rb'
run 'rm app/helpers/application_helper.rb'
run 'rm app/views/layouts/application.html.erb'
run 'rm app/models/.gitkeep'
run 'rm config/application.rb'
run 'rm config/routes.rb'
run 'rm config/database.yml'
run 'rm db/seeds.rb'
run 'rm public/index.html'
run 'rm .rspec'
run 'rm spec/spec_helper.rb'
run 'rm features/support/paths.rb'

