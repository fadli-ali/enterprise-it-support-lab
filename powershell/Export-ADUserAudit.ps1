# Export users from the departmental OUs to a CSV report.
# Run this on a domain-joined system with the ActiveDirectory module available.

$SearchBase = "OU=Departments,OU=NovaCore,DC=corp,DC=novacore,DC=test"
$OutputPath = "$env:USERPROFILE\Desktop\NovaCore-User-Audit.csv"

# Retrieve every user in the Departments OU and its child OUs.
$Users = Get-ADUser -Filter * `
    -SearchBase $SearchBase `
    -SearchScope Subtree `
    -Properties Department, PasswordLastSet, LastLogonDate

# Keep only the fields needed for the report.
$Report = $Users | Select-Object Name, SamAccountName, Department, Enabled, PasswordLastSet, LastLogonDate

# Save the results as a clean CSV file.
$Report | Export-Csv $OutputPath -NoTypeInformation

Write-Host "User audit exported to $OutputPath"
