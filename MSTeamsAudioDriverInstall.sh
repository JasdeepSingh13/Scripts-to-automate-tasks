#!/bin/sh

########################################################

# Author: Jasdeep Singh (jasdeep_singh@yahoo.co.in)

# Script to install Microsoft Teams Audio Drivers

########################################################

sudo killall Teams


sudo installer -pkg /Applications/Microsoft\ teams\ classic.app/Contents/SharedSupport/MSTeamsAudioDevice.pkg -target /



exit 0		## Success
exit 1		## Failure