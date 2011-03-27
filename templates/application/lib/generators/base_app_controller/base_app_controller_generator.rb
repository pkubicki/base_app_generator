require 'generators/rails/responders_controller_generator'

module Rails
  module Generators
    class BaseAppControllerGenerator < RespondersControllerGenerator
      source_root File.expand_path("../templates", __FILE__)
      hook_for :acl, :as => :yamled_acl
      hook_for :resource_locale, :as => :resource_locale
      hook_for :features, :as => :cucumber_features
      
      def add_resource_route
        return if options[:actions].present?
        route_config =  class_path.collect{|namespace| "namespace :#{namespace} do " }.join(" ")
        route_config << "resources :#{file_name.pluralize}"
        route_config << " end" * class_path.size
        route route_config
      end
      
    end
  end
end
