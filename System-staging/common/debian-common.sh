#!/bin/bash
#
# Base package installation for ubuntu 18.04
# dev-github@wizardrylab.com
# 01/2019

WL_Update(){
	sudo apt update
	}

WL_Upgrade(){
	WL_Update
	sudo apt upgrade
	}

WL_CleanUp(){
	sudo apt autoremove
	sudo apt autoclean
	}

