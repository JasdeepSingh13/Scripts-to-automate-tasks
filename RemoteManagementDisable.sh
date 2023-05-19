#!/bin/bash

#Disable remote management ARD

sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -stop


exit 0