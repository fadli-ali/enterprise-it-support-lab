# KB-001: Secure Active Directory Password Reset

## Purpose

Use this procedure when a domain user cannot sign in and a password reset may be required. The goal is to restore access without weakening identity verification or exposing credentials.

## Audience

Tier 1 Help Desk and IT Support staff with delegated password-reset permissions.

## Before the reset

1. Verify the user's identity with an approved company method.
2. Confirm the correct account. Do not rely only on a display name.
3. Review the account in Active Directory Users and Computers:
   - Enabled or disabled state
   - Account expiration
   - Password options
   - Any visible lockout indication
4. Check the current lockout state with PowerShell when available:

```powershell
Get-ADUser username -Properties LockedOut |
Select-Object SamAccountName,LockedOut
```

The **Unlock account** control in Active Directory Users and Computers can be confusing because it acts as an action when a lockout exists. It is not a reliable status display after clicking **Apply**. Use the `LockedOut` property to confirm the current state and do not describe the account as locked without evidence.

## Reset procedure

1. Right-click the verified user account and select **Reset Password**.
2. Create a unique temporary password that meets the domain password policy.
3. Select **User must change password at next logon**.
4. Select **Unlock the user's account** only when the account is confirmed as locked.
5. Complete the reset and give the temporary password to the verified user through an approved secure channel.
6. Never place the temporary password in the ticket, email or chat history.
7. Have the user sign in and create a private password.
8. Confirm that the user can reach the desktop and required resources.
9. Record the account checks, reset action and sign-in result in the ticket.

## Escalate when

- The account locks again immediately after the reset.
- Sign-in logs or the user's report suggest suspicious activity.
- The account is privileged and the reset is outside your delegated authority.
- The reset succeeds but authentication still fails.
- Replication, domain-controller availability or trust problems are suspected.

## Example resolution note

> Verified the user's identity and confirmed the correct account. The account was enabled, not expired and not actively locked. Reset the password to a temporary value, required a change at next sign-in and verified successful authentication on the domain workstation. No password was recorded in the ticket.

## Related record

- [HD-001: Unable to Sign In](../tickets/HD-001-jordan-sign-in.md)
