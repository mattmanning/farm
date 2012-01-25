require 'rest_client'

module Farm
  class Http
    def self.heroku_run(cmd)
      endpoint = RestClient::Resource.new "https://api.heroku.com/apps/#{ENV['APP_NAME']}/ps",
        '', ENV['API_KEY']
      endpoint.post({ :command => 'rake farm:run', :ps_env => { 'CMD' => cmd } },
                      :accept => 'application/json')
    end
  end
end
