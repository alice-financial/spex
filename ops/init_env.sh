#!/usr/bin/env bash

# https://github.com/guard/listen/wiki/Increasing-the-amount-of-inotify-watchers
setting="fs.inotify.max_user_watches=524288"
file="/etc/sysctl.conf"
if ! grep -q "$setting" $file; then
  echo 'increasing file monitoring limit'
  echo $setting | sudo tee -a $file && sudo sysctl -p
fi
