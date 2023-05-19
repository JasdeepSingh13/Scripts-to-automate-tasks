#!/bin/bash

######################################################## 

# Author: Jasdeep Singh (jasdeep_singh@yahoo.co.in)

######################################################## 

#Disable remote management ARD

sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -stop


exit 0
