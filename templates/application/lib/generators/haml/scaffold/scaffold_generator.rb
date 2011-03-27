require 'rails/generators/erb/scaffold/scaffold_generator'
require 'generators/generated_attribute_on_steroids'

module Haml
  module Generators
    class ScaffoldGenerator < Erb::Generators::ScaffoldGenerator
      source_root File.expand_path("../templates", __FILE__)

      def initialize(args, *options) #:nodoc:
        super(args, options)
        extend_attributes! if respond_to?(:attributes)
      end
      
      def copy_view_files
        available_views.each do |view|
          filename = filename_with_extensions(view)
          template "#{view}.html.haml", File.join("app/views", controller_file_path, filename)
        end
      end

      hook_for :form_builder, :as => :scaffold

      def copy_form_file
        if options[:form_builder].nil?
          filename = filename_with_extensions("_form")
          template "_form.html.haml", File.join("app/views", controller_file_path, filename)
        end
      end

    protected

      def available_views
        %w(index edit show new)
      end

      def handler
        :haml
      end

      def extend_attributes!
        self.attributes = (attributes || []).map do |a|
          ::Generators::GeneratedAttributeOnSteroids.new(a.name, a.type)
        end
      end
      
    end
  end
end
