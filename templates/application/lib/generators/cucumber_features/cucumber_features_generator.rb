module Rails
  module Generators
    class CucumberFeaturesGenerator < NamedBase
      
      source_root File.expand_path('../templates', __FILE__)
      
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
      
      class_option :dir, :type => :string, :default => "features", :desc => "The directory where the features should go"
      
      def copy_file
        template "template.feature", File.join(options[:dir], "#{table_name}.feature")
      end
    end
  end
end