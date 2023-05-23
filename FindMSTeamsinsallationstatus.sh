#!/bin/bash

########################################################

# Author: Jasdeep Singh (jasdeep_singh@yahoo.co.in)

########################################################

app_name="Microsoft Teams"

# Find the .app using mdfind
app_path=$(mdfind "kMDItemContentType == 'com.apple.application-bundle' && kMDItemFSName == '*.app' && kMDItemDisplayName == '$app_name'")

if [ -n "$app_path" ]; then
  echo "$app_name is installed at: $app_path"
else
  echo "$app_name is not installed"
fi