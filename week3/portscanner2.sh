#!/bin/bash

ip=$1
port=$2

# Help Function
Help(){
echo "HELP MENU"
echo "-------------"
echo "Usage: bash portscanner.sh <HOSTFILE> <PORTFILE>"
echo "-------------"
}


# check correct parameters
if [ ! ${#} -eq 2 ]; then
	Help
	exit;
fi

# main
echo "ip,port"
for i in $(seq 1 254)
do
	host="$ip.$i" 
	timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null &&
		echo "$host,$port"
done
