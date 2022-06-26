#!/bin/sh

if [$1 = ""];then
	echo "usage ./crack <ip>"
	exit 1
else
	scp -P 4242 level09@$1:~/token .
    chmod a=r token
	gcc crack.c -o reverse
    ./reverse $(cat token)
fi