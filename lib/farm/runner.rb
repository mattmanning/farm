require 'cgi'
require 'farm/http'
require 'yaml'

module Farm
  class Runner
    def self.run(*args)
      @payload_object = args.shift[:payload_object]

      unless @payload_object.respond_to?(:perform)
        raise ArgumentError, 'Cannot run items which do not respond to perform'
      end

      if ENV['FARM_ENV'].to_s.strip == 'local'
        `rake farm:run CMD='#{serialized}'`
      else
        Farm::Http.heroku_run serialized
      end
    end

    def self.serialized
      CGI.escape(YAML.dump(@payload_object))
    end
  end
end