Farm
====

"Farm out" background jobs by running them immediately as a one-off Heroku process. Only works with Rails >= 3.0.

Install:

    gem install farm

Set the environment variables `API_KEY` and `APP_NAME`.

Call with the farm method:

    Foo.bar       #=> Run directly
    Foo.farm.bar  #=> Run in background as one-off Heroku process.

Sincere thanks to [https://github.com/collectiveidea/delayed_job](https://github.com/collectiveidea/delayed_job) from which I copied lots of code and functionality.