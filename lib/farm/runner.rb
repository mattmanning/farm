require 'cgi'
require 'yaml'

module Farm
  class Runner
    def self.run(*args)
      @payload_object ||= args.shift[:payload_object]

      unless @payload_object.respond_to?(:perform)
        raise ArgumentError, 'Cannot run items which do not respond to perform'
      end

      %x[rake farm:run CMD='#{CGI.escape(YAML.dump(@payload_object))}']
    end
  end
end