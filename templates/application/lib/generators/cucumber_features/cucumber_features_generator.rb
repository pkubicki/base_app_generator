require 'rails/generators/active_record/model/model_generator'
require 'generators/generated_attribute_on_steroids'

module Rails
  module Generators
    class CucumberFeaturesGenerator < NamedBase
      
      source_root File.expand_path('../templates', __FILE__)
      
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
      
      class_option :dir, :type => :string, :default => "features", :desc => "The directory where the features should go"
      
      def initialize(args, *options) #:nodoc:
        super(args, options)
        extend_attributes! if respond_to?(:attributes)
      end
      
      def copy_file
        template "template.feature", File.join(options[:dir], "#{table_name}.feature")
      end
      
      protected
    
      def extend_attributes!
        self.attributes = (attributes || []).map do |a|
          ::Generators::GeneratedAttributeOnSteroids.new(a.name, a.type)
        end
      end
      
    end
  end
end
