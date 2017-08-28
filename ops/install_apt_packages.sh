#!/usr/bin/env bash
# (c) 2016 Alice, author: David Chang
# This code is licensed under MIT license (see LICENSE.txt for details)

echo 'updating package list'
apt-get update >/dev/null 2>&1
echo 'updated'

echo 'installing apt packages'
apt-get -y install curl
apt-get -y install git
