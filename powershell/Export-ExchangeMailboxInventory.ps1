# Export an Exchange Online mailbox inventory to CSV.
# Replace the placeholder UPN with the authorized administrator account.

$AdminUPN = "admin@tenant.onmicrosoft.com"
$OutputPath = "$env:USERPROFILE\Desktop\Mailbox-Inventory.csv"

# Connect using Microsoft's interactive sign-in process.
Connect-ExchangeOnline -UserPrincipalName $AdminUPN

# Retrieve the mailboxes and keep the useful inventory fields.
$Mailboxes = Get-EXOMailbox -ResultSize Unlimited
$Report = $Mailboxes | Select-Object DisplayName, PrimarySmtpAddress, RecipientTypeDetails

# Save the inventory to the administrator's desktop.
$Report | Export-Csv $OutputPath -NoTypeInformation

Write-Host "Mailbox inventory exported to $OutputPath"

# End the administrative session when the task is complete.
Disconnect-ExchangeOnline -Confirm:$false
