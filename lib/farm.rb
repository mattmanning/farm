require 'active_support'
require 'farm/message_sending'
require 'farm/performable_method'

Object.send(:include, Farm::MessageSending)
Module.send(:include, Farm::MessageSending::ClassMethods)