module Rails
  module Generators
    class ResourceLocaleGenerator < NamedBase
      
      source_root File.expand_path('../templates', __FILE__)
      
      class_option :dir, :type => :string, :default => "config/locales/pl/resources", :desc => "The directory where the locales should go"
      
      def copy_file
        template "locale.yml", File.join(options[:dir], "#{table_name}.yml")
      end
    end
  end
end
