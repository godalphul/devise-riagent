#require "" #File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'neo4j.rb')

#class DeviseRiagent
  module Generators
    class ModelGenerator < Base #:nodoc:
      desc "Creates a Riagent model"
      argument :attributes, type: :array, default: [], banner: 'field:type field:type'
      check_class_collision
      class_option :timestamps, type: :boolean
      
      def create_model_file
        template 'model.erb', File.join('app/models', "#{singular_name}.rb")
      end
      
      protected
      
        def migration?
          false
        end
        
        def timestamps?
          options[:timestamps]
        end
        
        
        def timestamp_statements
          '
          attribute :created_at, type: DateTime
          attribute :updated_at, type: DateTime
          '   
        end
        
        hook_for :test_framework
      end
    end
  end
#end