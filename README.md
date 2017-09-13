Spex
====

[![Code Climate](https://codeclimate.com/github/eyefodder/spex/badges/gpa.svg)](https://codeclimate.com/github/eyefodder/spex)

## Simplest Possible Examples

When I try to get a new piece of code working, it's often useful to have a standalone, isolated, _working_   example demonstrating what I want to acheive. This repo is intended to address that. The base app will seem a little dull; it's basically a blank canvas. For each example, you want to check out the relevant branch. A list of the branches and their descriptions below:

Branch | Description
-------|------------
[base_ruby_environment] (spex_branches/base_ruby_environment.md) | A basic dev box for ruby development. No Rails dependencies. The box installs postgres and sqlite, as well as the ruby 2.1 dev package (can be configured)
[base_rails_app] (spex_branches/base_rails_app.md) | A smoke test for a rails dev environment, and as close to the output from `rails new ...` as possible. Postgresql is used for Active record instead of SQlite and rubyracer is used as a JavaScript runtime
[building_ruby_from_source] (spex_branches/building_ruby_from_source.md)| Showing how to compile Ruby from source as part of your Vagrant Box setup
[rspec_guard] (spex_branches/rspec_guard.md) | Setting up Guard to to run your RSpec tests when files change
[rspec_guard_spring] (spex_branches/rspec_guard_spring.md) | Setting up Spring with Rspec and Guard to run your tests faster
[guard_growl] (spex_branches/guard_growl.md) | Setting up Growl to get notifications from your Virtual Machine
[code_coverage] (spex_branches/code_coverage.md) | Getting code coverage setup on your app
[duplicating_repo] (spex_branches/duplicating_repo.md) | A way to duplicate a rails app (e.g. one of these examples) into a new repo
[continuous_integration] (spex_branches/continuous_integration.md) | Setting up rspec to output Ci friendly reports
[image_upload] (spex_branches/image_upload.md) | A simple example of uploading images to the server using [CarrierWave] (https://github.com/carrierwaveuploader/carrierwave)
[stripe_payments] (spex_branches/stripe_payments.md) | A simpe working example showing use of the [Stripe Payments API] (https://stripe.com/docs/api)


## Before you begin
1. Install [Vagrant] (http://www.vagrantup.com/downloads.html)
2. Install [VirtualBox] (https://www.virtualbox.org/wiki/Downloads)
3. Install [Vagrant Triggers Plugin] (https://github.com/emyl/vagrant-triggers)
4. Open a terminal window and cd to the 'ops' folder of this repo
5. Type the following (you only need to do this on first run): `vagrant plugin install vagrant-vbguest`
6. Now type `vagrant up` and witness as a new machine gets downloaded and configured. The guest box is where your code will run when you're working with it.


### Warnings / Errors you will see that are nothing to worry about
1. `std is not a tty`
2. `Guest addition do not match on this machine`
3. `In most cases it is ok that the windows systems driver installation fail`
4. `passing vesrion to postgresql server is deprecated...`

### Once you're up and running
When you are working like this, you now have a machine running all on its lonesome and isolated from any other stuff on your laptop. It is like running a whole new machine in a box though so it will consume disk space and RAM. You can shut it down / pause it just like a real machine. Here are some useful commands:

1. `vagrant up` (re)starts the machine so you can work with the app
2. `vagrant suspend` This is like stopping the machine in time. Resuming work is super fast, and the box wont consume RAM or CPU, but will take up a big chunk of disk space (about 2GB) plus whatever was in RAM
3. `vagrant halt` This is like shutting the machine down. Takes longer to start than `suspend` but RAM isn't written to disk so it takes less space
4. `vagrant destroy` This is like throwing the box out the window. You can always start afresh with `vagrant up` but it will have to go through that initial install which might take a few minutes...

### Using this project as a starter app

1. Clone this project `git clone git@github.com:alice-financial/spex.git chat-spk`
2. Remove the remote reference to this repo `git remote remove origin`
4. Edit `ops/Vagrantfile` and change the `config.vm.host_name` and `config.vm.provider/vb.name` properties from 'spex' to a name better suited to your project
5. Code away
