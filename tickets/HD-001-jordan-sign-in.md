# HD-001: Unable to Sign In

| Field | Details |
| --- | --- |
| User | Jordan Lee |
| Account | `jlee-admin` |
| Category | Identity and access |
| Type | Incident |
| Priority | Medium |
| Impact | One user unable to access a Help Desk account |
| Status | Resolved |

## User report

Jordan returned after time away and could not sign in to `NOVA-WS01` with the password available to him. His identity was verified before any account changes were made.

## Investigation

1. Located the existing account in Active Directory Users and Computers.
2. Confirmed that the account was configured with no expiration date.
3. Checked the account lockout state with PowerShell:

```powershell
Get-ADUser jlee-admin -Properties LockedOut |
Select-Object SamAccountName,LockedOut
```

4. PowerShell returned `LockedOut: False`, so an active lockout was not recorded as the cause.
5. Kept the existing account instead of deleting or recreating it.

## Resolution

1. Reset the password to a temporary value after identity verification.
2. Selected **User must change password at next logon**.
3. Did not record the temporary or final password in the ticket.
4. Signed in to `NOVA-WS01` with `CORP\jlee-admin`.
5. Completed the required password change.

## Verification

- Jordan successfully signed in to the domain client using the new private password.
- The existing AD account and its delegated Help Desk access were preserved.

## Resolution note

Verified the caller's identity and reviewed the existing AD account. The account was enabled, configured not to expire and not actively locked when checked. Reset the password to a temporary value and required a password change at the next sign-in. Confirmed successful authentication on `NOVA-WS01`. No credentials were stored in the ticket.

