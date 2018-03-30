#!/bin/bash
apt install -y ntp
/etc/init.d/ntp stop
sed -r 's/ubuntu.pool.ntp.org/ua.pool.ntp.org/g' /etc/ntp.conf > /etc/ntp.back
cat /etc/ntp.back > /etc/ntp.conf
x=`pwd`
echo "*/5 * * * * root $x/ntp_verify.sh">>/etc/crontab

/etc/init.d/ntp start


