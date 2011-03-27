  module Generators
    class GeneratedAttributeOnSteroids < Rails::Generators::GeneratedAttribute
      
      def search_field_type        
        @search_field_type = case
          when [:text, :datetime, :timestamp, :date].include?(type)
            :text_field
          else 
            field_type
          end
      end
      
      def form_field_type        
        @form_field_type = case
          when [:datetime, :timestamp, :date].include?(type)
            :text_field
          else 
            field_type
          end
      end
      
      def within_range?
        @within_range ||= [
          :integer, 
          :float, 
          :decimal, 
          :datetime, 
          :timestamp, 
          :date
        ].include?(type)
      end
      
      def search_suffix
        @search_suffix ||= case type
          when :string, :text
            '_contains'
          else
            '_eq'
        end
      end
      
      def datetime?
        [:datetime, :timestamp].include?(type)
      end
      
      def date?
        :date == type
      end
      
      def string?
        :string == type
      end
      
      def text?
        :text == type
      end
      
    end
  end
