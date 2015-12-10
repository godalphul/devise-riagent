require 'generators/devise/orm_helpers'
#require 'generators/riagent/model'

module Riagent
  module Generators
    class DeviseGenerator < ::Rails::Generators::NamedBase
      include ::Devise::Generators::OrmHelpers
  
      def generate_model
        invoke "riagent-document:model", [name] unless model_exists? && behavior == :invoke
      end
    

      def inject_field_types
        inject_into_file model_path, model_contents , :after => /Riagent::ActiveDocument\n/ if model_exists?
      end

      def inject_devise_content
        inject_into_file model_path,  migration_data , :after => /Riagent::ActiveDocument\n/ if model_exists?
      end
      
    
    def migration_data
<<RUBY
    #
    # Riagent.rb needs to have attribute definitions before any validations. So, the attribute block needs to come before
    # loading your devise modules.
    #
    # If you add another devise module (such as :lockable, :confirmable, or :token_authenticatable), be sure to
    # uncomment the attribute definitions for those modules. Otherwise, the unused attribute definitions can be deleted.
    #

     attribute :username, type: String
     attribute :facebook_token, type: String
     index :facebook_token

     attribute :created_at, type: DateTime
     attribute :updated_at, type: DateTime

     ## Database authenticatable
     attribute :email, type: String, null: false, default: ""
     index :email

     attribute :encrypted_password

     ## If you include devise modules, uncomment the properties below.

     ## Rememberable
     attribute :remember_created_at, type: DateTime
     attribute :remember_token
     index :remember_token


     ## Recoverable
     attribute :reset_password_token
     index :reset_password_token
     attribute :reset_password_sent_at, type: DateTime

     ## Trackable
     attribute :sign_in_count, type: Integer, default: 0
     attribute :current_sign_in_at, type: DateTime
     attribute :last_sign_in_at, type: DateTime
     attribute :current_sign_in_ip, type:  String
     attribute :last_sign_in_ip, type: String

     ## Confirmable
     # attribute :confirmation_token
     # index :confirmation_token
     # attribute :confirmed_at, type: DateTime
     # attribute :confirmation_sent_at, type: DateTime

     ## Lockable
     #  attribute :failed_attempts, type: Integer, default: 0
     # attribute :locked_at, type: DateTime
     #  attribute :unlock_token, type: String,
     # index :unlock_token

      ## Token authenticatable
      # attribute :authentication_token, type: String, null: true, index: :exact

RUBY
      end
    end
  end
end