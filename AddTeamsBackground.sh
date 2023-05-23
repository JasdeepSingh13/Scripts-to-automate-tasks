#!/bin/bash

########################################################

# Author: Jasdeep Singh (jasdeep_singh@yahoo.co.in)

########################################################

# Get the current user
current_user=`stat -f%Su /dev/console`

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