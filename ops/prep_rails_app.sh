#!/usr/bin/env bash
# init

# (c) 2014 Eyefodder, author: Paul Barnes-Hoggett
# This code is licensed under MIT license (see LICENSE.txt for details)
cd /app
echo 'prepping rails app'
bundle install
rake db:migrate
rake db:seed
echo '
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$                                                                            $$
$$                                                                            $$
$$               /$$$$$$$  /$$$$$$   /$$$$$$  /$$   /$$                       $$
$$              /$$_____/ /$$__  $$ /$$__  $$|  $$ /$$/                       $$
$$              |  $$$$$$ | $$  \ $$| $$$$$$$$ \  $$$$/                       $$
$$               \____  $$| $$  | $$| $$_____/  >$$  $$                       $$
$$               /$$$$$$$/| $$$$$$$/|  $$$$$$$ /$$/\  $$                      $$
$$              |_______/ | $$____/  \_______/|__/  \__/                      $$
$$                        | $$                                                $$
$$                        | $$                                                $$
$$                        |__/                                                $$
$$                                                                            $$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$                                                                            $$
$$                                                                            $$
$$    This virtual machine is setup to run the spex app example(s) in its own $$
$$    environment.                                                            $$
$$                                                                            $$
$$    If you are developing and trying out changes, you will need to run the  $$
$$    following command to keep things in synch:                              $$
$$                                                                            $$
$$                            "vagrant rsync-auto"                            $$
$$                                                                            $$
$$    You are now ready to start the app. In order to do this, you need to    $$
$$    jump into the virtual machine and start the app:                        $$
$$                                                                            $$
$$                            vagrant ssh                                     $$
$$                            cd /app                                         $$
$$                            rails s                                         $$
$$                                                                            $$
$$    When you have done that, the app will be accessible at                  $$
$$                                                                            $$
$$                            http://localhost:3001                           $$
$$                                                                            $$
$$      See! that was easy wasnt it?!!                                        $$
$$                                                                            $$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
'

