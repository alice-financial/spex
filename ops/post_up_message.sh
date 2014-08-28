#!/usr/bin/env bash
# init

# (c) 2014 Eyefodder, author: Paul Barnes-Hoggett
# This code is licensed under MIT license (see LICENSE.txt for details)
echo '
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$                                                                            $$
$$                                                                            $$
$$                /$$$$$$$  /$$$$$$   /$$$$$$  /$$   /$$                      $$
$$               /$$_____/ /$$__  $$ /$$__  $$|  $$ /$$/                      $$
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
$$    When you have done that, the root folder of this repo will be           $$
$$    accessible within the VM at `/app` To go check it out, you can ssh      $$
$$    into the machine really simply:                                         $$
$$                                                                            $$
$$                            vagrant ssh                                     $$
$$                                                                            $$
$$                            cd /app and there it is...                      $$
$$                                                                            $$
$$    See! that was simple wasnt it?!!                                        $$
$$                                                                            $$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
'