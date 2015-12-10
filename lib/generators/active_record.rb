require 'devise-riagent/generators/named_base'
require 'devise-riagent/generators/active_model'


module ActiveRiagent
  module Generators # :nodoc:
    class Base < Rails::Generators::NamedBase # :nodoc:
      include ActiveRecord::Generators::Migration

      # Set the current directory as base for the inherited generators.
      def self.base_root
        File.dirname(__FILE__)
      end
    end
  end
end