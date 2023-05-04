#!/bin/bash

# VARIABLES
screenSaverModuleName="Helios"
screenSaverFileName="Helios.saver"
screenSaverPath="/Library/Screen Savers"


# DO NOT EDIT BELOW THIS LINE
user=$(last | grep "logged in" | grep "console" | awk '{print $1}');
huuid=$(system_profiler SPHardwareDataType | awk '/Hardware UUID/ {print $3}')

/usr/libexec/PlistBuddy -c "Set moduleDict:moduleName $screenSaverModuleName" /Users/$user/Library/Preferences/ByHost/com.apple.screensaver.$huuid.plist
/usr/libexec/PlistBuddy -c "Set moduleDict:path $screenSaverPath/$screenSaverFileName" /Users/$user/Library/Preferences/ByHost/com.apple.screensaver.$huuid.plist

setName=$(/usr/libexec/PlistBuddy -c "Print moduleDict:moduleName" /Users/$user/Library/Preferences/ByHost/com.apple.screensaver.$huuid.plist)
setFile=$(/usr/libexec/PlistBuddy -c "Print moduleDict:path" /Users/$user/Library/Preferences/ByHost/com.apple.screensaver.$huuid.plist)


defaults -currentHost write com.apple.screensaver idleTime -int 600

osascript -e 'tell application "System Events" to set require password to wake of security preferences to true' 


killall cfprefsd