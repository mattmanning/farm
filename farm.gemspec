$:.unshift File.expand_path("../lib", __FILE__)
require "farm/version"

Gem::Specification.new do |gem|
  gem.name    = "farm"
  gem.version = Farm::VERSION

  gem.author      = "Matt Manning"
  gem.email       = "matt.manning@gmail.com"
  gem.homepage    = "http://mwmanning.com/"
  gem.summary     = "Run background jobs as one-off Heroku processes."
  gem.description = "Run background jobs as one-off Heroku processes."

  gem.files = %x{ git ls-files }.split("\n").select { |d| d =~ %r{^(README|lib/)} }

  gem.add_dependency "heroku", "~> 2.18.1"
  gem.add_dependency "rails", "~> 3.0"
  gem.add_dependency "rake"
  gem.add_dependency "rest-client", "~> 1.6.7"
end
