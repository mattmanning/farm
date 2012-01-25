require 'farm'

module Farm
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'farm/tasks.rb'
    end
  end
end
