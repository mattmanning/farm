module Farm
  class Runner
    def self.run(*args)
      @payload_object ||= args.shift[:payload_object]

      unless @payload_object.respond_to?(:perform)
        raise ArgumentError, 'Cannot run items which do not respond to perform'
      end

      @payload_object.perform
    end
  end
end