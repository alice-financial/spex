Spex: Guard Growl
===========================

Building on the setup using Guard, Spring and RSpec, this branch shows how to trigger Growl notifications on your host system. The only tricky thing is in telling the gest OS the IP address of the host machine.
This is handled with the script `setup_guest_bash_profile.sh`

For this to work, you will need the following setup:

1. Vagrant version 1.6.4 or higher
1. [Vagrant Triggers] (https://github.com/emyl/vagrant-triggers) plugin installed.
1. Growl installed on host machine with network notifications setup:
..1. Growl > Preferences > Network > 'listen for incoming notifications' checked
..1. with a password set too

For more details, read my post about the process [on my blog] (http://eyefodder.com/2014/09/growl-guard-virtual-machine.html)