#!/usr/bin/env bash
# (c) 2014 Eyefodder, author: Paul Barnes-Hoggett
# This code is licensed under MIT license (see LICENSE.txt for details)
function duplicate_repo(){
  cd ../../
  appname='new_app'
  tmp_folder="${appname}_tmp"
  old_repo=https://github.com/eyefodder/spex.git
  new_repo=https://github.com/eyefodder/alice.git
  branch=duplicating_repo

  # mkdir $appname


  # make a bare copy of the repository
  clone_old_repo
  checkout_new_repo
  remove_spex_readmes
  change_start_screen
  # find_and_replace_spex
  rename_spex_puppet_modules

  echo 'before exit'
  exit 0
  echo 'after exit'

  # check out the fresh repo

  # remove spex specific folder

  # change gemset
  sed -i '' -e  "s/spex/$appname/g" Gemfile
  # change occurrences in config files:
  find ./config -type f -exec sed -i '' -e "s/spex/$appname/g" {} \;
  # change ops references
  find ./ops -type f -exec sed -i '' -e 's/spex/new_app/g' {} \;
  # rename puppet modules
  mv ops/puppet/modules/spex ops/puppet/modules/new_app
}
function rename_spex_puppet_modules(){
  mv ops/puppet/modules/spex ops/puppet/modules/$appname
}
function find_and_replace_spex(){
  find ./ -type f -exec sed -i '' -e "s/spex/$appname/g" {} \;
}
function change_start_screen(){
  # change vagrant up message
  sed -i '' -e  "s/spex app example(s)/$appname/g" ops/prep_rails_app.sh
  sed -i '' -e '/begin ascii header/,/end ascii header/d' ops/prep_rails_app.sh
}
function remove_spex_readmes(){
    rm -rf spex_branches
  # rewrite the README:
  readme=README.md
  echo $appname > $readme
  echo '============' >> $readme
}
function checkout_new_repo(){
  rm -rf $appname
  git clone $new_repo $appname
  cd $appname
}

function clone_old_repo(){
  rm -rf $tmp_folder
  git clone --bare -b $branch --single-branch $old_repo $tmp_folder
  cd $tmp_folder
  git push --mirror $new_repo
  cd ..
  rm -rf $tmp_folder
}


duplicate_repo






