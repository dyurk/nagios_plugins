#!/bin/bash
# Nagios check to verify link speed. By default it alerts on anything below 1GigE

INTER=`ls /sys/class/net/`
CHECK=`for i in $INTER; do sudo ethtool $i | egrep '(Mb/s)';done`

if [ -z "$CHECK" ] ; then 
	echo "UNKNOWN: Unable to check interface"
	exit 3
fi

case $CHECK in
*10000Mb/s)
echo "OK: Link speed 10000Mb/s"
exit 0;;
*1000Mb/s)
echo "OK: Link speed 1000Mb/s"
exit 0;;
*100Mb/s)
echo "WARNING: Link speed 100Mb/s"
exit 2;;
*)
echo "UNKNOWN"
exit 3;;
esac
