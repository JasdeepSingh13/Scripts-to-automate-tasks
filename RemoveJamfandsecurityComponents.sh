#!/bin/bash


######################################################## 

# Author: Jasdeep Singh (jasdeep_singh13@yahoo.co.in)  

# Date: 7/20/2020  

######################################################## 


# Remove all system profiles
for identifier in $(/usr/bin/profiles -L | awk "/attribute/" | awk '{print $4}'); do
    /usr/bin/profiles -R -p "$identifier" >/dev/null 2>&1
done

echo “System Profiles Gone!”

# Reset authorisation database

rm /var/db/auth.db

# Remove all profiles installed by MDM
/usr/local/jamf/bin/jamf removeMdmProfile

echo "MDM Profile Gone!"


# Remove JAMF Framework
/usr/local/jamf/bin/jamf removeFramework

echo "jamf binary Gone!"

# Remove all Profiles
/usr/bin/profiles -D -f -v

echo "Profiles Gone!"


# Remove WindowsDefenderATP

echo "Is WDAV installed?"
ls -ld '/Applications/Microsoft Defender ATP.app' 2>/dev/null

echo "Uninstalling WDAV..."
rm -rf '/Applications/Microsoft Defender ATP.app'
rm -rf Library/Application\ Support/Microsoft\ Defender\ ATP

echo "Is WDAV still installed?"
ls -ld '/Applications/Microsoft Defender ATP.app' 2>/dev/null

echo "Done!"

# Remove Tanium
launchctl unload /Library/LaunchDaemons/com.tanium.taniumclient.plist
launchctl remove com.tanium.taniumclient > /dev/null 2>&1
rm /Library/LaunchDaemons/com.tanium.taniumclient.plist
rm /Library/LaunchDaemons/com.tanium.trace.recorder.plist
rm -rf /Library/Tanium/
rm /var/db/receipts/com.tanium.taniumclient.TaniumClient.pkg.bom
rm /var/db/receipts/com.tanium.taniumclient.TaniumClient.pkg.plist 

echo "Tanium Gone!"

# Remove Cisco any connect
/opt/cisco/vpn/bin/vpn_uninstall.sh

echo "CiscoAnyConnect Gone!"

# Remove CompanyPortal
ls -ld '/Applications/Company Portal.app' 2>/dev/null
rm -rf /Applications/Company\ Portal.app
rm -R Library/Application\ Support/com.microsoft.CompanyPortal
rm -R Library/Application\ Support/Company\ Portal

# Remove Cisco Jabber
rm -rf /Applications/Cisco\ Jabber.app
rm -R /Library/Application\ Support/JAMF/Receipts/CiscoJabberMac-12.8.1.302494.pkg
rm -R /Library/Cisco/Jabber/Accessories/CiscoPlugin/com.cisco.jabber.accesories.CiscoJabberPlugin.plist
rm -R /Library/Cisco/Jabber/Accessories/CiscoPlugin/CiscoJabberPlugin.dylib
rm -R /Library/Cisco/Jabber/Accessories/Jabra/libJabraCiscoJabberPlugin.dylib
rm -R /Library/Cisco/Jabber/Accessories/Jabra/com.cisco.jabber.accesories.jabra.plist
rm -R /Library/Cisco/Jabber/Accessories/LogiUCPlugin/com.cisco.jabber.accesories.LogiUCPlugin.plist

exit 0