
#!/usr/bin/env bash
cd /app
echo 'installing app dependencies'
bundle install
echo 'creating databases'
bundle exec rake db:create
#bundle exec rake parallel:create

echo 'loading schema'
bundle exec rake db:schema:load
#bundle exec rake parallel:prepare
echo 'seeding the db'
bundle exec rake db:seed
