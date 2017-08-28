# A sample Guardfile
# More info at https://github.com/guard/guard#readme

# Note: The cmd option is now required due to the increasing number of ways
#       rspec may be run, below are examples of the most common uses.
#  * bundler: 'bundle exec rspec'
#  * bundler binstubs: 'bin/rspec'
#  * spring: 'bin/rsspec' (This will use spring if running and you have
#                          installed the spring binstubs per the docs)
#  * zeus: 'zeus rspec' (requires the server to be started separetly)
#  * 'just' rspec: 'rspec'
require 'active_support/core_ext'


host_ip = ENV['HOST_IP']
growl_pass = ENV['GROWL_PASSWORD']
PLACEHOLDER_GROWL_PASS='enter_growl_password'

if host_ip.blank? || growl_pass.blank? || (growl_pass==PLACEHOLDER_GROWL_PASS)
  puts 'host notifcations off: you must set HOST_IP and GROWL_PASSWORD in ops/dotfiles/guest_bash_profile'
  notification :off
else
  notification :gntp, :sticky => false, :host => ENV['HOST_IP'], :password => ENV['GROWL_PASSWORD']
end



guard :rspec, cmd: 'bin/rspec' do
  # run a spec file if it changes
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }

  # re-run if spec helper or rails helper changes
  watch('spec/spec_helper.rb')  { "spec" }
  watch('spec/rails_helper.rb')  { "spec" }

  # Rails

  # run a file matching same path with _spec at the end
  # eg /app/models/foo.rb will run /spec/models/foo_spec.rb
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }

  # same thing for other file types
  watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$})          { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }

  # when something in spec/support (usually helpers for the spec) we re-run the spec
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }

  # any routing specific tests
  watch('config/routes.rb')                           { "spec/routing" }

  # follow this pattern for any other abstract classes
  watch('app/controllers/application_controller.rb')  { "spec/integration" }

  # if any layouts change, re-run integration specs
  watch(%r{^app/views/layouts/(.*)}) { 'spec/integration' }

  # if something within a view folder changes, run that spec
  # eg app/views/static/anyfile runs /spec/integration/static_pages_spec.rb
  watch(%r{^app/views/(.+)/}) do |m|
    "spec/integration/#{m[1].singularize}_pages_spec.rb"
  end

  # if a controller changes, run the integration tests
  # eg app/controllers/static_controller.rb runs
  # /spec/integration/static_pages_spec.rb
  watch(/^app\/controllers\/(.+)_controller.rb/) do |m|
    ["spec/integration/#{m[1].singularize}_pages_spec.rb",
    "spec/routing/#{m[1]}_routing_spec.rb"]
  end

end

