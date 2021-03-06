module Rails
  module Generators
    class LocaleGenerator < NamedBase
      
      source_root File.expand_path('../templates', __FILE__)
      
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
      
      class_option :dir, :type => :string, :default => "config/locales/pl", :desc => "The directory where the locales should go"
      
      def copy_file
        template "locale.yml", File.join(options[:dir], "#{table_name}.yml")
      end
    end
  end
end