#!/bin/bash

# Specify the path of the existing folder
folderPath="/path/to/existing/folder"

# Specify the desired name of the folder in the Dock
dockFolderName="New Folder"

# Get the current user's home directory
userHome=$(eval echo ~${SUDO_USER})

# Add the folder to the Dock preferences of the current user
/usr/libexec/PlistBuddy -c "Add persistent-others:0 dict" "$userHome/Library/Preferences/com.apple.dock.plist"
/usr/libexec/PlistBuddy -c "Add persistent-others:0:tile-data dict" "$userHome/Library/Preferences/com.apple.dock.plist"
/usr/libexec/PlistBuddy -c "Add persistent-others:0:tile-data:file-data dict" "$userHome/Library/Preferences/com.apple.dock.plist"
/usr/libexec/PlistBuddy -c "Add persistent-others:0:tile-data:file-data:_CFURLString string $folderPath" "$userHome/Library/Preferences/com.apple.dock.plist"
/usr/libexec/PlistBuddy -c "Add persistent-others:0:tile-data:file-data:_CFURLStringType integer 0" "$userHome/Library/Preferences/com.apple.dock.plist"
/usr/libexec/PlistBuddy -c "Add persistent-others:0:tile-type string 'directory-tile'" "$userHome/Library/Preferences/com.apple.dock.plist"
/usr/libexec/PlistBuddy -c "Add persistent-others:0:displayas integer 1" "$userHome/Library/Preferences/com.apple.dock.plist"
/usr/libexec/PlistBuddy -c "Add persistent-others:0:file-type integer 2" "$userHome/Library/Preferences/com.apple.dock.plist"
/usr/libexec/PlistBuddy -c "Add persistent-others:0:showas integer 1" "$userHome/Library/Preferences/com.apple.dock.plist"
/usr/libexec/PlistBuddy -c "Add persistent-others:0:name string $dockFolderName" "$userHome/Library/Preferences/com.apple.dock.plist"

# Restart the Dock to apply changes
killall Dock