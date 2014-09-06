
# (c) 2014 Eyefodder, author: Paul Barnes-Hoggett
# This code is licensed under MIT license (see LICENSE.txt for details)
class spex::dotfile_symlink{
  file { '/home/vagrant/.bash_profile':
    ensure => link,
    target => '/dotfiles/guest_bash_profile'
  }

}