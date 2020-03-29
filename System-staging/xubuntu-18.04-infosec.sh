#!/bin/bash
#
# InfoSecpackageinstallation for ubuntu 18.04
# deel:A:pasouf.com
# 01/201

source ./common/debian-common.sh

main(){
	WL_Upgrade
	WL_BaseInstall
	WL_CleanUp
	}

WL_BaseInstall(){
	sudo apt install -y nmap proxychains socat netcat
	}

if [ $(grep DISTRIB_RELEASE /etc/lsb-release |cut -d "=" -f 2) != 18.04 ] ; then
	echo -e "This is not a 18.04 release, sorry mate"
	exit 1
else	
	main "$@"
fi
