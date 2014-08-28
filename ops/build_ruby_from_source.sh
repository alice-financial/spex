#!/usr/bin/env bash
# (c) 2014 Eyefodder, author: Paul Barnes-Hoggett
# This code is licensed under MIT license (see LICENSE.txt for details)

echo "current ruby version: $(ruby -e 'print RUBY_VERSION')"
if [ "$(ruby -e 'print RUBY_VERSION')" = '2.1.2' ]
  then
  echo "ruby already installed, skipping"
else
  echo "Installing ruby 2.1.2"
  rm -rf /opt/vagrant_ruby
  echo 'downloading'
  curl --remote-name http://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.2.tar.gz >/dev/null 2>&1
  tar zxf ruby-2.1.2.tar.gz >/dev/null 2>&1
  cd ruby-2.1.2/
  echo 'configure'
  ./configure >/dev/null 2>&1
  echo 'make (this could take a while, while I make ruby, you should make tea...)'
  make  >/dev/null 2>&1
  echo 'install'
  make install >/dev/null 2>&1
  echo "ruby installed"
fi

echo "install bundler"
gem install bundler