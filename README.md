Spex
====

## Simplest Possible Examples

When I try to get a new piece of code working, it's often useful to have a standalone, isolated, _working_   example demonstrating what I want to acheive. This repo is intended to address that. The base app will seem a little dull; it's basically a blank canvas. For each example, you want to check out the relevant branch. A list of the branches and their descriptions below:

Branch | Description
-------|------------
base_ruby_environment | A basic dev box for ruby development. No Rails dependencies. The box installs postgres and sqlite, as well as the ruby 2.1 dev package (can be configured)
base_rails_app | A smoke test for a rails dev environment, and as close to the output from `rails new ...` as possible. Postgresql is used for Active record instead of SQlite and rubyracer is used as a JavaScript runtime

## Before you begin
1. Install [Vagrant] (http://www.vagrantup.com/downloads.html)
2. Install [VirtualBox] (https://www.virtualbox.org/wiki/Downloads)
3. Open a terminal window and cd to the 'ops' folder of this repo
4. Type the following (you only need to do this on first run): `vagrant plugin install vagrant-vbguest`
5. Now type `vagrant up` and witness as a new machine gets downloaded and configured. The guest box is where your code will run when you're working with it.
 

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
