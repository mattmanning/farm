require 'active_support'
require 'farm/message_sending'
require 'farm/performable_method'
require 'farm/railtie' if defined?(Rails)

Object.send(:include, Farm::MessageSending)
Module.send(:include, Farm::MessageSending::ClassMethods)