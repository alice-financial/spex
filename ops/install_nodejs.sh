#!/usr/bin/env bash

node -v | grep 'v6'
if [[ $? != 0 ]]; then
  curl -sL https://deb.nodesource.com/setup_6.x | bash -
  sudo apt-get install -y nodejs
else
  echo "nodejs already installed, skipping"
fi
