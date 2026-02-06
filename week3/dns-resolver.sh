#!/bin/bash

ip=$1
dns=$2

echo "ip,dns"
for i in $(seq 1 254)
do
	host="$ip.$i"
	up=$(nslookup $host $dns | grep "=")
	
	if [[ -n $up ]]; then
		echo $up
	fi
done
