#!/bin/bash
#
# SDR package installation for ubuntu 18.04
# deel:A:pasouf.com
# 01/2019

source ./common/debian-common.sh

main(){
	WL_Upgrade
	WL_Purge	# CAUTION !
	WL_BaseInstall
	WL_Volk
	WL_CleanUp
		}

WL_Purge(){
	sudo apt-get purge --auto-remove gqrx
	sudo apt-get purge --auto-remove gqrx-sdr
	sudo apt-get purge --auto-remove libgnuradio*
	}

WL_BaseInstall(){
	sudo add-apt-repository -y ppa:ettusresearch/uhd	
	sudo add-apt-repository -y ppa:bladerf/bladerf
	sudo add-apt-repository -y ppa:myriadrf/drivers
	sudo add-apt-repository -y ppa:myriadrf/gnuradio
	sudo add-apt-repository -y ppa:gqrx/gqrx-sdr
	WL_Update
	sudo apt install -y rtl-sdr librtlsdr-dev hackrf libhackrf-dev  uhd-host libuhd-dev 
	sudo apt install -y gnuradio gnuradio-dev gqrx-sdr gr-osmosdr gr-iqbal
	sudo apt install -y limesuite limesuite-udev soapysdr-module-lms7
	}

WL_Volk(){
	sudo apt install -y libvolk1-bin libvolk1-dev
	volk_profile
	}
	
if [ $(grep DISTRIB_RELEASE /etc/lsb-release |cut -d "=" -f 2) != 18.04 ] ; then
	echo -e "This is not a 18.04 release, sorry mate"
	exit 1
else	
	main "$@"
fi
