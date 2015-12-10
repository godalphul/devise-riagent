require 'devise-riagent'
require 'devise/orm/riagent/date_time'
#require 'orm_adapter/adapters/mongoid'
require 'devise/adapters/riagent'

Riagent::ActiveDocument::ClassMethods.send :include, Devise::Models