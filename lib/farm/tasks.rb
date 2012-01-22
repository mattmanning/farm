require 'cgi'
require 'yaml'

namespace :farm do
  desc "Farm out a method call."
  task :run => :environment do
    puts YAML.load(CGI.unescape(ENV['CMD'])).perform
  end
end