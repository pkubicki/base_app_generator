require 'rails/generators/resource_helpers'

module Rails
  module Generators
    class YamledAclGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers

      source_root File.expand_path('../templates', __FILE__)

      def copy_file
        path  = File.expand_path(Rails.root.join("#{YamledAcl.files_with_permissions_path}"), __FILE__)
        template 'acl.yml', "#{path}/#{controller_file_path}.yml"
      end
    end
  end
end
