#!/usr/bin/env bash
# (c) 2014 Eyefodder, author: Paul Barnes-Hoggett
# This code is licensed under MIT license (see LICENSE.txt for details)

echo 'installing puppet'
# gem update puppet --no-rdoc --no-ri
gem install puppet -v 4.5.3 --no-rdoc --no-ri

if [ ! -e "/etc/puppet/modules/apt/" ]; then
  echo 'installing apt module'
  puppet module install puppetlabs-apt --version 1.6.0 --modulepath /etc/puppet/modules
else
  echo 'apt module already installed'
fi

if [ ! -e "/etc/puppet/modules/postgresql/" ]; then
  echo 'installing postgresql module'
  puppet module install puppetlabs-postgresql --modulepath /etc/puppet/modules
else
  echo 'postgresql module already installed'
fi

if [ ! -e "/etc/puppet/modules/timezone/" ]; then
  echo 'installing timezone module'
  puppet module install saz-timezone --modulepath /etc/puppet/modules
else
  echo 'timezone module already installed'
fi

if [ ! -e "/etc/puppet/modules/redis/" ]; then
  echo 'installing redis module'
  puppet module install thomasvandoren-redis --modulepath /etc/puppet/modules
else
  echo 'redis module already installed'
fi
