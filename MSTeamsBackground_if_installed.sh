#!/bin/bash

########################################################

# Author: Jasdeep Singh (jasdeep_singh@yahoo.co.in)

########################################################

app_name="Microsoft Teams"

# Check if Microsoft Teams.app is installed
if [ ! -d "/Applications/$app_name.app" ]; then
  echo "$app_name is not installed. Exiting..."
  exit 0
fi

# Find the .app using mdfind
app_path=$(mdfind "kMDItemContentType == 'com.apple.application-bundle' && kMDItemFSName == '*.app' && kMDItemDisplayName == '$app_name'")

if [ -n "$app_path" ]; then
  echo "$app_name is installed at: $app_path"
else
  echo "$app_name is not installed"
fi

# Get the current user
current_user=$(stat -f%Su /dev/console)

# Define the path to the background images folder
backgrounds_folder="/Users/$current_user/Library/Application Support/Microsoft/Teams/Backgrounds/Uploads/"

# Check if the backgrounds folder exists
if [ -d "$backgrounds_folder" ]; then
  echo "Backgrounds folder already exists."
else
  # Create the backgrounds folder
  mkdir -p "$backgrounds_folder"
  echo "Backgrounds folder created successfully."
fi

# Move the background images to the backgrounds folder
cp /private/tmp/Teams_Backgrounds/* "$backgrounds_folder"

# Set the background images folder path in Teams preferences
defaults write com.microsoft.teams NSNavLastRootDirectory -string "$backgrounds_folder"
echo "Backgrounds folder set successfully."