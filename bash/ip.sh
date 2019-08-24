#!/usr/bin/env sh

# check public ip of current machine
#
# usage:
# 1. adjust file permission (if you have not): `chmod +x ip`
# 2. copy or link this file to your path (ie. `ln -s $(pwd)/ip /usr/local/bin`)
# 3. run ip

if [ -z "$1" ]; then
	echo "checking ip.."
	LASTIP="$HOME/lastipaddr"
	GETIPADDR="checkip.amazonaws.com"
	CURRENTIP=$(curl $GETIPADDR 2>/dev/null)
	if [ -f $LASTIP ]
	then
	   # compare last word in file $LASTIP with $CURRENTIP
	   if [ `awk 'END {print $NF}' $LASTIP` = $CURRENTIP ]
	   then
	       echo "$CURRENTIP (Unchanged)"
	   else
	       echo "$(date "+%F %T %Z") - $CURRENTIP" >> $LASTIP
	       echo "$CURRENTIP (Changed)"
	    fi
	else
	    echo $CURRENTIP >> $LASTIP
	fi
elif [ $1 = "ls" ]; then
	# check last 3 IPs
	LASTIP="$HOME/lastipaddr"
	tail -n 5 $LASTIP
else
	echo "ip - check public ip of current machine"
  	echo "usage:"
  	echo "- ip: check current ip (done via $GETIPADDR)"
  	echo "- ip ls: list history of this machine's public ip"
  	exit
fi