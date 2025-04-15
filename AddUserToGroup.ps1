# This script simplifies the process of adding a user to the needed group. 
# Tools like evil-winrm do not support certain foreign languages thus you need to use variables and numbers
# This script will add the user to the group #4 in the list of all groups of the domain. Should be ran on the DC

$User = "username"
# Retrieve all group names into an array
$Groups = Get-ADGroup -Filter * | Select-Object -ExpandProperty Name

# Check to ensure the fourth group exists
if ($Groups.Count -ge 4) {
    # Get the fourth group (index 3)
    $FourthGroup = $Groups[3]
    
    # Add the user to the fourth group
    Add-ADGroupMember -Identity $FourthGroup -Members $User -ErrorAction SilentlyContinue
} else {
    Write-Host "There are fewer than four groups available."
}
