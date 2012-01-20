require 'active_support/basic_object'
require 'active_support/core_ext/module/aliasing'

module Farm
  class FarmProxy < ActiveSupport::BasicObject
    def initialize(payload_class, target, options)
      @payload_class = payload_class
      @target = target
      @options = options
    end

    def method_missing(method, *args)
      Runner.run({:payload_object => @payload_class.new(@target, method.to_sym, args)}.merge(@options))
    end
  end

  module MessageSending
    def farm(options = {})
      FarmProxy.new(PerformableMethod, self, options)
    end

    module ClassMethods
      def handle_asynchronously(method, opts = {})
        aliased_method, punctuation = method.to_s.sub(/([?!=])$/, ''), $1
        with_method, without_method = "#{aliased_method}_with_farm#{punctuation}", "#{aliased_method}_without_farm#{punctuation}"
        define_method(with_method) do |*args|
          curr_opts = opts.clone
          curr_opts.each_key do |key|
            if (val = curr_opts[key]).is_a?(Proc)
              curr_opts[key] = if val.arity == 1
                val.call(self)
              else
                val.call
              end
            end
          end
          farm(curr_opts).__send__(without_method, *args)
        end
        alias_method_chain method, :farm
      end
    end
  end
end
