# (c) 2014 Eyefodder, author: Paul Barnes-Hoggett
# This code is licensed under MIT license (see LICENSE.txt for details)
class spex::base_packages{
    class { 'apt':
    always_apt_update    => true,
  }
  ensure_packages(['build-essential',"zlib1g-dev", "libssl-dev", 'libreadline-dev', 'git-core', 'curl', 'libyaml-dev' , 'libcurl4-openssl-dev'])
  ensure_packages(['libsqlite-dev',"libsqlite3-ruby", "postgresql", 'libpq-dev', 'sqlite3', 'libsqlite3-dev', 'bcrypt' , 'libnotify-bin'])
  ensure_packages(['imagemagick','libqtwebkit-dev', 'graphviz'])
}
