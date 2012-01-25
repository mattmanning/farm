require 'cgi'
require 'yaml'

namespace :farm do
  task :run => :environment do
    YAML.load(CGI.unescape(ENV['CMD'])).perform
  end
end