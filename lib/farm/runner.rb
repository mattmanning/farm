module Farm
  class Runner
    def run(*args)
      options = {}.merge!(args.extract_options!)

      options[:payload_object] ||= args.shift

      unless options[:payload_object].respond_to?(:perform)
        raise ArgumentError, 'Cannot run items which do not respond to perform'
      end

      options[:payload_object].perform
    end
  end
end