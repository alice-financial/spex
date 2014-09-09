#!/usr/bin/env bash
# (c) 2014 Eyefodder, author: Paul Barnes-Hoggett
# This code is licensed under MIT license (see LICENSE.txt for details)
cd ../../
appname='new_app'
tmp_folder="${appname}_tmp"
new_repo=https://github.com/eyefodder/spex.git

# mkdir $appname


# make a bare copy of the repository
rm -rf $tmp_folder
git clone --bare -b master --single-branch $new_repo $tmp_folder
cd $tmp_folder
git push --mirror https://github.com/eyefodder/alice.git
cd ..
rm -rf $tmp_folder

# check out the fresh repo
rm -rf $appname
git clone $new_repo $appname
cd $appname
# remove spex specific folder
rm -rf spex_branches
# rewrite the README:
readme=README.md
echo $appname > $readme
echo '============' >> $readme

