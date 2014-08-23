Spex: Base Ruby Environment
===========================

This is a basic ruby development environment that doesn't yet have rails setup for it. It's there to demonstrate getting up and running using Vagrant and Puppet to install a standalone environment. General Instructions and details are provided in the main README file, so check those out first. 

## Dev environment details
Name | Value
-----|------
OS | Ubuntu 12.04 64 bit 'precise'
packages installed | build-essential, zlib1g-dev, libssl-dev, libreadline-dev, git-core, curl, libyaml-dev, libcurl4-openssl-dev, postgresql, libpq-dev, sqlite3, libsqlite-dev, bcrypt, libnotify-bin
Ruby Version | 2.1.2 (can be configured in ops/puppet/hieradata/common.yaml)
