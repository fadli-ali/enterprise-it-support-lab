# PowerShell Scripts

These scripts are based on administrative tasks completed in the lab. They are intentionally short so each command and pipeline stage can be explained clearly.

## Export-ADUserAudit.ps1

Creates a CSV report of users stored in the departmental OUs.

The pipeline performs three main actions:

1. `Get-ADUser` retrieves the accounts and requested properties.
2. `Select-Object` chooses the report columns.
3. `Export-Csv` saves the results to the current administrator's desktop.

### Requirements

- A domain-joined Windows system
- The ActiveDirectory PowerShell module
- Permission to read the target OU

## Export-ExchangeMailboxInventory.ps1

Connects to Exchange Online and exports mailbox names, addresses and recipient types.

The script was designed to show the difference between regular user mailboxes, shared mailboxes and system mailboxes.

### Requirements

- The ExchangeOnlineManagement PowerShell module
- An authorized Exchange Online administrator account
- Interactive Microsoft sign-in

### Security notes

- No password or access token is stored in either script.
- The Exchange administrator UPN is a placeholder and must be replaced before use.
- The Exchange Online session is disconnected after the export completes.
