# (c) 2014 Eyefodder, author: Paul Barnes-Hoggett
# This code is licensed under MIT license (see LICENSE.txt for details)
Exec {
  path => "/usr/bin:/usr/local/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/vagrant_ruby/bin"
}
include spex::base_packages
include spex::postgres_setup
include spex::ruby_setup
include spex::dotfile_symlink