#!/bin/bash
#
# Base package installation for Kali rolling
# deel:A:pasouf.com
# 01/2019

source ./common/debian-common.sh

main(){
	WL_Upgrade
	WL_BaseInstall
	WL_CleanUp
	}

WL_BaseInstall(){
	sudo apt install -y apt-file locate
	sudo apt-file update
	sudo updatedb
	}


if [ $(grep DISTRIB_RELEASE /etc/lsb-release |cut -d "=" -f 2) != "kali-rolling" ] ; then
	echo -e "This is not a Kali rolling, sorry mate"
	exit 1
else	
	main "$@"
fi
