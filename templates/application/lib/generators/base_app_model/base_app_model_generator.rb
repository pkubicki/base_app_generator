require 'rails/generators/active_record/model/model_generator'
require 'generators/generated_attribute_on_steroids'

module Rails
  module Generators
    class BaseAppModelGenerator < ActiveRecord::Generators::ModelGenerator
      source_root File.expand_path("../templates", __FILE__)
      hook_for :model_locale, :as => :model_locale
      
      def initialize(args, *options) #:nodoc:
        super(args, options)
        extend_attributes! if respond_to?(:attributes)
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
