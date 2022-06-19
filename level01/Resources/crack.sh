#!/bin/sh

if [$1 = ""];then
	echo "usage ./crack <ip>"
	exit 1
else
	scp -P 4242 level00@$1:/etc/passwd .
	/usr/sbin/john ./passwd --show
fi

