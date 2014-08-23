# (c) 2014 Eyefodder, author: Paul Barnes-Hoggett
# This code is licensed under MIT license (see LICENSE.txt for details)
class spex::ruby_setup{
  include apt
  apt::ppa{'ppa:brightbox/ruby-ng-experimental':
    before => Class['ruby'],
  }
  class { 'ruby':
    version  => hiera('ruby::params::version'),
  }

  package {'bundler':
    ensure  => 'installed',
    require => Class['ruby'],
    provider => 'gem',
  }

}