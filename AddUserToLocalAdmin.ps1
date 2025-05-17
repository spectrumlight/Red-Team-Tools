# This script add a user to local administrators
# To list local groups run this command PS > Get-LocalGroup
# Depending on the number in the list of groups your index will vary

# Set username to add
$userToAdd = "YourUsernameHere"

# Get the group by index (0-based, so index 2 is the third item — Администраторы)
$targetGroup = Get-LocalGroup | Select-Object -Index 2

# Add user to the group
Add-LocalGroupMember -Group $targetGroup.Name -Member $userToAdd
