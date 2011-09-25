require 'thor'
require 'thor/group'
require 'active_support/inflector'

module BaseAppGenerator
  class AppBuilder < ::Thor::Group
    include Thor::Actions   
    
    argument :name, :type => :string, :desc => "Name of the application"
    source_root File.expand_path("../../..", __FILE__)

    def new
      run "rails new #{name} --skip-prototype --skip-test-unit --database=mysql --template=#{self.class.source_root}/templates/template.rb"
    end
    
    def modify_environments_production
      inside(name) do
        gsub_file(
          'config/environments/production.rb', 
          '# config.assets.precompile += %w( search.js )',
          'config.assets.precompile += %w( admin.js admin.css )'
        )
        gsub_file(
          'config/environments/production.rb', 
          'config.assets.compress = true', 
          "config.assets.compress = true\n  # Choose the compressors to use\n  config.assets.js_compressor  = :uglifier\n  config.assets.css_compressor = :yui"
        )
      end
    end
    
    def copy_template_files
      directory("templates/application", name)
    end
    
    def pickle_ambiguous_step_comments
src_str = <<-src
# create models from a table
Given(/^the following \#{capture_plural_factory} exists?:?$/) do |plural_factory, table|
  create_models_from_table(plural_factory, table)
end
src

dest_str = <<-dest
# create models from a table - ambiguous
# Given(/^the following \#{capture_plural_factory} exists?:?$/) do |plural_factory, table|
#   create_models_from_table(plural_factory, table)
# end
dest
      inside(name) do
        gsub_file(
          'features/step_definitions/pickle_steps.rb', 
          src_str,
          dest_str
        )
      end
    end
    
# create models from a table
#Given(/^the following #{capture_plural_factory} exists?:?$/) do |plural_factory, table|
#  create_models_from_table(plural_factory, table)
#end
    
    def initialize_git_repository
      inside(name) do
        run 'git init'
        run 'git add .'
        run 'git commit -am "Initial commit"'
      end
    end

    protected
    
    def name_const
      name.camelize
    end
    
  end
end
