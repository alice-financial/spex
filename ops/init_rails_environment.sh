#!/usr/bin/env bash

# (c) 2014 Eyefodder, author: Paul Barnes-Hoggett
# This code is licensed under MIT license (see LICENSE.txt for details)

cd /app
echo 'running first time install, this may take a while...'
bundle install
rake db:create
echo 'first time install done!'