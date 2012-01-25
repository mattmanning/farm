Farm
====

"Farm out" background jobs by running them immediately as a one-off Heroku process.

Installation and Setup:
-----------------------

    gem install farm

Set the environment variables `API_KEY` and `APP_NAME` to your Heroku API key and the name of your app on Heroku, respectively.

### Rails >= 3.0:

The installation is finished.

### Other Ruby apps:

Add the following lines to your Rakefile:

    require 'farm'
    require 'farm/tasks'

The Rakefile must also define a task called 'environment'. This task should load your application so that the farmed-out method can be executed in context.

Usage:
------

    Foo.bar       #=> Run directly
    Foo.farm.bar  #=> Run in background as one-off Heroku process.

For local development, set the environment variable `FARM_ENV=local`. This will cause background tasks to be run as local rake tasks, rather than one-off Heroku processes.

Sincere thanks to [https://github.com/collectiveidea/delayed_job](https://github.com/collectiveidea/delayed_job) from which I copied lots of code and functionality.