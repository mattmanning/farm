require 'cgi'
require 'yaml'

namespace :farm do
  task :run => :environment do
    puts YAML.load(CGI.unescape(ENV['CMD'])).perform
  end
end