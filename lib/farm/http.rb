require 'json'
require 'rest_client'

module Farm
  class Http
    def self.heroku_run(cmd)
      endpoint    = RestClient::Resource.new "https://api.heroku.com/apps/#{ENV['APP_NAME']}/ps",
                    '', ENV['API_KEY']
      headers     = { :accept => 'application/json' }
      post_params = { :command => 'rake farm:run', :ps_env => { 'CMD' => cmd } }
      response    = endpoint.post post_params, headers
      JSON.parse response
    end
  end
end
