Farm
====

"Farm out" background jobs by running them immediately as a one-off Heroku process. Only works with Rails >= 3.0.

Install:

    gem install farm

Set the environment variables `API_KEY` and `APP_NAME` to your Heroku API key and the name of your app on Heroku, respectively.

Call with the farm method:

    Foo.bar       #=> Run directly
    Foo.farm.bar  #=> Run in background as one-off Heroku process.

For local development, set the environment variable `FARM_ENV=local`. This will cause background tasks to be run as local rake tasks, rather than one-off Heroku processes.

Sincere thanks to [https://github.com/collectiveidea/delayed_job](https://github.com/collectiveidea/delayed_job) from which I copied lots of code and functionality.