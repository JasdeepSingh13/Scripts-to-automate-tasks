#!/bin/bash

######################################################## 

# Author: Jasdeep Singh (jasdeep_singh@yahoo.co.in)  

# Date: 12/15/2020  

######################################################## 


sudo dscl . create /Users/AccountName IsHidden 1

sudo defaults write /Library/Preferences/com.apple.loginwindow HiddenUsersList -array-add AccountName


exit 0