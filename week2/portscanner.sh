#!/bin/bash

empty=""
hostfile=$1
portfile=$2

# Help Function
Help(){
echo "HELP MENU"
echo "-------------"
echo "Usage: bash portscanner.sh <HOSTFILE> <PORTFILE>"
echo "-------------"
}

# error checking

# check correct parameters
if [ ! ${#} -eq 2 ]; then
	Help
	exit;
fi

# check file type
if [[ ($hostfile != *".txt") || ($portfile != *".txt") ]]; then
	echo "pls use a .txt file for both the host file and port file!"
	exit 1
fi

# check file exists
if [[ (! -e $hostfile) || (! -e $portfile)  ]]; then
	echo "one of the specified files does not exist in this directory. please try again."
	exit 1
fi

echo "host,port"
for host in $(cat $hostfile); do
	for port in $(cat $portfile); do
		timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null &&
			echo "$host,$port"
	done
done
