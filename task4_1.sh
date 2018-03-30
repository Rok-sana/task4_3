#!/bin/bash
echo "--- Hardware ---" >task4_1.out
echo "CPU: "

echo  "RAM: "
`free -m -h | grep Mem | cut -d":" -f2 | awk '{print $1}'`>>task4_1.out

echo "Motherboard:" 
`dmidecode -s baseboard-product-name`>>task4_1.out

echo -n "System Serial Number:"
 `dmidecode -s system-serial-number`>>task4_1.out

echo "--- System ---"

echo -n "OS Distribution: "
`lsb_release -d -s`>>task4_1.out

echo -n "Kernel version: "
uname -r


echo -n "Installation date: : " >> task4_1.out
`ls -clt / | tail -n 1 | awk '{ print $7, $6, $8 }'`

echo -n "Hostname: "`hostname`>>task4_1.out

echo "Uptime: `uptime -p | awk -F "up " '{print $2}'`">> task4_1.out

echo "Processes running: `ps | awk '/ps/ {print $1}'`" >>task4_1.out

echo "User logged in:" `who | wc -l`>>task4_1.out

echo "--- Network ---">>task4_1.out

ip -a -f inet addr show | awk '{print $1" Iface name "$2 " : "  $4}'>>task4_1.out
