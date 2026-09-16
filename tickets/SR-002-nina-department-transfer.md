# SR-002: HR to Finance Department Transfer

| Field | Details |
| --- | --- |
| User | Nina Rivera |
| Account | `nrivera` |
| Category | Identity and access |
| Type | Service request |
| Priority | Normal |
| Impact | Department access and user profile update |
| Approval | HR and Finance manager approval confirmed |
| Status | Completed |

## Request

Move Nina Rivera from HR to Finance. Remove her HR access, grant the approved Finance access and preserve her account and password.

## Starting state

- User object located in the HR OU.
- Member of `GG-HR`.
- HR share mapped as drive `H:`.
- Existing account and password remained valid.

## Changes completed

1. Recorded the user's original group membership.
2. Moved the user object from the HR OU to the Finance OU.
3. Updated the **Department** attribute to `Finance`.
4. Removed the user from `GG-HR`.
5. Added the user to `GG-Finance`.
6. Used the existing group-based permission structure instead of assigning permissions directly to the user.
7. Signed out and back in so Windows created an updated security token.
8. Removed the stale HR mapped drive.
9. Mapped drive `F:` to `\\NOVA-DC01\Finance`.

## Verification

- `\\NOVA-DC01\Finance` opened successfully.
- `\\NOVA-DC01\HR` returned an access denied message.
- The new Finance mapped drive opened successfully.
- The account and password were preserved.
- Final group membership showed `GG-Finance` and no `GG-HR` membership.

## Resolution note

Completed the approved HR to Finance transfer for Nina Rivera. Updated the AD OU and Department attribute, removed `GG-HR`, added `GG-Finance` and refreshed the user's sign-in token. Verified successful Finance share access and confirmed that the HR share was denied. Removed the obsolete HR mapped drive and mapped the Finance share as drive `F:`. No direct user permissions were assigned.
