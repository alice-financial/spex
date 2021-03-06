Spex: Base Rails App
===========================

Building on the base_ruby_environment, we now have a base rails app to build.
This is very close to the output of `rails new ...` except that we have changed
the database.yaml to use postgresql.

The Dev ops provisioning file is also setup to do a couple of things to keep
life in check:

2. Each time the dev environment is launched the following tasks are run:
* `bundle install` to install any missing gems
* `rake db:create` to create any database(s) needed
* `rake db:migrate` to perform any migrations
* `rake db:seed` to pre-populate the database with any seed data
* `rake test:prepare` to, well, prepare the test suite...

For more details, read my post about the app [on my blog] (http://www.eyefodder.com/2014/08/building-pristine-rails-virtual-machine.html)


