#!/usr/bin/env bash
# (c) 2014 Eyefodder, author: Paul Barnes-Hoggett
# This code is licensed under MIT license (see LICENSE.txt for details)



add_comment_once(){
  comment=$1
  grep -q "$comment" $bash_file
  if [ $? -ne 0 ]
  then
    echo "# $comment" >> $bash_file
  fi
}

add_bash_entry(){
  token=$1
  default=$2
  change_message="You need to enter your $1 in $bash_file"
  entry_comment=$3

  grep -q $token= $bash_file
  if [ $? -eq 0  ]
  then
    grep -q $default $bash_file
    if [ $? -eq 0 ]
    then
      # entry exists, but it's set to default value from this script
      echo $change_message
    fi
  else
    # variable entry doesn't exist
    echo $change_message
    echo $entry_comment
    echo "" >> $bash_file
    echo "# $entry_comment" >> $bash_file
    echo "export $token=$default" >> $bash_file
    echo " " >> $bash_file
  fi
}

#make a profile file if it doesnt exist
mkdir -p dotfiles
bash_file=dotfiles/guest_bash_profile
touch $bash_file

add_comment_once "(c) 2014 Eyefodder, author: Paul Barnes-Hoggett"
add_comment_once "This code is licensed under MIT license (see LICENSE.txt for details)"
add_comment_once "Edit the following values with your own values"



# ask for the growl password here
add_bash_entry GROWL_PASSWORD enter_growl_password "Growl password set in Growl > Preferences > Network"


# Deal with entries overwritten each time
# ip address is re-written every time this script runs
# delete existing host IP entry

add_comment_once "The following entries are automatically generated"
add_comment_once "Do not edit unless you know what you are doing!"
add_comment_once "They are regenerated each time the virtual machine is rebooted"


sed -i '' '/HOST_IP/d' $bash_file
# grab current host IP
ipaddr=`ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d ' ' -f2`
# and write to file
echo "export HOST_IP=$ipaddr" >> $bash_file
