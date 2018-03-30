#!/bin/bash

/bin/ps aux | pgrep ntp | wc -l
if [[ $? -ne 0 ]]
then
  service ntp start
   
fi

diff /etc/ntp.conf  /etc/ntp.conf.
diff  /etc/ntp.conf /etc/ntp.back 
if [[ $? -ne 0 ]]
then
  cat /etc/ntp.back  > /etc/ntp.conf
  service ntp restart

fi
