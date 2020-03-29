#!/bin/bash
#
# Base package installation for ubuntu 18.04
# deel:A:pasouf.com
# 01/2019

source ./common/debian-common.sh

main(){
	WL_Upgrade
	WL_BaseInstall
	WL_GoogleChrome
	WL_CleanUp
	}

WL_BaseInstall(){
	sudo apt install -y wget apt-file locate openssh-server
	sudo apt-file update
	sudo updatedb
	}

WL_GoogleChrome(){
	sudo sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	WL_Update
	sudo apt-get install -y google-chrome-stable
	}

if [ $(grep DISTRIB_RELEASE /etc/lsb-release |cut -d "=" -f 2) != 18.04 ] ; then
	echo -e "This is not a 18.04 release, sorry mate"
	exit 1
else	
	main "$@"
fi
