nmap -n -sn --open 10.0.5.2-50 --oG temp.txt 1> /dev/null

cat temp.txt \
	| grep "Host:" \
	| grep -o -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
