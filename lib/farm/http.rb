require 'rest_client'

module Farm
  class Http
    def self.heroku_run(cmd)
      endpoint = RestClient::Resource.new "https://api.heroku.com/apps/#{ENV['APP_NAME']}/ps",
        '', ENV['API_KEY']
      endpoint.post :command => cmd, :accept => 'application/json'
    end
  end
end

# curl -H "Accept: application/json" \
#   -u :4e358ef46173ceeaf4ca6bcac86c948a27a9eb02 \
#   -d "command=cmd" \
#   -X POST https://api.heroku.com/apps/appname/ps