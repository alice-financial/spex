#!/usr/bin/env bash

#make a profile file if it doesnt exist
bash_file=dotfiles/guest_bash_profile
touch $bash_file

add_bash_entry(){
  token=$1
  default=$2
  change_message="You need to enter your $3 in $bash_file"

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
    echo "export $token=$default" >> $bash_file
  fi
}

# ask for the growl password here
add_bash_entry GROWL_PASSWORD enter_growl_password "growl password"

# ip address is re-written every time this script runs
# delete existing host IP entry
sed -i '' '/HOST_IP/d' $bash_file
# grab current host IP
ipaddr=`ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d ' ' -f2`
# and write to file
echo "export HOST_IP=$ipaddr" >> $bash_file
