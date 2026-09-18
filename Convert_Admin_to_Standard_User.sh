#!/bin/sh

########################################################

# Author: Jasdeep Singh (jasdeep_singh@yahoo.co.in)

########################################################

#
#     Convert_Admin_to_Standard_User.sh
#     Remove admin privileges from logged in user
#



####################



loggedInUser=$(/usr/bin/stat -f%Su "/dev/console")



####################



# Remove admin privileges from $loggedInUser.
if /usr/bin/dscl . -read "/groups/admin" GroupMembership | /usr/bin/grep -q "$loggedInUser"; then
  /usr/sbin/dseditgroup -o edit -d "$loggedInUser" admin
  echo "Removed $loggedInUser admin privileges."
else
  echo "$loggedInUser is already a standard user, no action required."
fi



exit 0
