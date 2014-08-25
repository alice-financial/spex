# (c) 2014 Eyefodder, author: Paul Barnes-Hoggett
# This code is licensed under MIT license (see LICENSE.txt for details)
class spex::ruby_setup{
  include apt
  # This is the repo available for Lucid, precise, raring, saucy & trusted
  # @ see http://www.ubuntuupdates.org/ppa/brightbox_ruby_ng_experimental
  apt::ppa{'ppa:brightbox/ruby-ng-experimental':
    before => Package['ruby'],
  }
  $package = hiera('ruby::params::dev_package')
  package{$package:
    ensure => installed,
    alias => 'ruby',
  }
  package {'bundler':
    ensure  => 'installed',
    require => Package['ruby'],
    provider => 'gem',
  }

}