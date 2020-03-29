#!/bin/bash
#
# devloppement package installation for ubuntu 18.04
# deel:A:pasouf.com
# 01/2019

source ./common/debian-common.sh

main(){
	WL_Upgrade
	WL_BaseInstall
	WL_Sublime3-Stable
	WL_CleanUp
	}

WL_BaseInstall(){
	sudo apt install -y build-essential geany
	}

WL_Sublime3-Stable(){
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	WL_Update
	sudo apt-get install -y sublime-text
	}

if [ $(grep DISTRIB_RELEASE /etc/lsb-release |cut -d "=" -f 2) != 18.04 ] ; then
	echo -e "This is not a 18.04 release, sorry mate"
	exit 1
else	
	main "$@"
fi
