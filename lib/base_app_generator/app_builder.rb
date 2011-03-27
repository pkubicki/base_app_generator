require 'thor'
require 'thor/group'
require 'active_support/inflector'

module BaseAppGenerator
  class AppBuilder < ::Thor::Group
    include Thor::Actions   
    
    argument :name, :type => :string, :desc => "Name of the application"
    source_root File.expand_path("../../..", __FILE__)

    def new
      run "rails new #{name} --skip-prototype --skip-test-unit --template=#{self.class.source_root}/templates/template.rb"
    end
    
    def copy_template_files
      directory("templates/application", name)
    end
    
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
