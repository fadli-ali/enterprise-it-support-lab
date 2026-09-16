# INC-002: Suspected Microsoft 365 Account Compromise

Simulated security-response exercise using a fictional employee account in a personal lab tenant.

| Field | Details |
| --- | --- |
| User | Jordan Kim |
| Account | `jkim@<lab-tenant>.onmicrosoft.com` (tenant name omitted) |
| Service | Microsoft 365 and Microsoft Entra ID |
| Severity | High |
| Impact | Potential unauthorized access to one cloud account |
| Status | Contained, investigated and closed |

## Problem

Jordan Kim's Microsoft 365 account was treated as potentially compromised. The response prioritized containment before restoring access.

## Containment

1. Disabled the account to block new sign-ins.
2. Revoked the user's active sessions.
3. Kept sign-in blocked while reviewing the account and rotating its credentials.

## Investigation

1. Reviewed Microsoft Entra sign-in logs for the user.
2. Compared the recorded activity with the user's known activity.
3. Found no unexplained sign-ins in the reviewed records.
4. Reviewed the authentication methods registered to the account.
5. Found no unexpected authentication method.

## Credential recovery

1. Reset the password while the account remained blocked.
2. Generated a temporary password without recording it in the incident notes.
3. Required the user to change the password during the next sign-in.
4. Re-enabled the account only after the review and password reset were complete.

## Verification

- The previous password failed, confirming that the old credential was no longer accepted.
- The temporary password succeeded.
- The user completed the forced password change.
- Outlook access was restored with the new private password.
- No unexpected authentication method remained on the account.

## Root cause and finding

The investigation did not confirm an account compromise. The sign-in activity reviewed matched the user, and no unauthorized authentication method was found. The account was still contained and the credentials were rotated because a suspected identity incident should be treated seriously until the available evidence has been reviewed.

## Prevention

- Keep MFA protections enabled for cloud accounts.
- Verify a user's identity before resetting credentials.
- Block sign-in and revoke sessions before investigating a suspected compromise.
- Review both sign-in activity and registered authentication methods.
- Require a private password change after issuing a temporary password.
- Document confirmed findings separately from assumptions.

## Resolution note

Blocked sign-in and revoked active sessions for the affected Microsoft 365 account. Reviewed Entra sign-in activity and authentication methods and found no unexplained activity or unexpected method. Reset the password while access remained blocked, then re-enabled the account after completing the review. Verified that the old password failed, the temporary password worked, the forced password change completed and Outlook access was restored.
