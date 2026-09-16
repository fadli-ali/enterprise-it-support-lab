# Employee Onboarding and Offboarding Procedure

## Purpose

This procedure provides a repeatable checklist for managing employee access across on-premises Active Directory and Microsoft 365. It covers onboarding, department transfers and offboarding in the NovaCore and AliGrowth Consulting lab environments.

## Before making changes

- Confirm the request is approved by the employee's manager or another authorized contact.
- Verify the employee's legal name, preferred display name, job title, department, manager and effective date.
- Identify the applications, shared folders, Microsoft 365 groups and Teams the employee needs.
- Record the request and approvals in the support ticket.
- Apply least privilege. Give the employee only the access required for the role.

## Onboarding checklist

### Active Directory

1. Create the user in the correct departmental OU.
2. Assign a unique username and user principal name that follow the company naming standard.
3. Enter the approved department, title and company attributes.
4. Set a unique temporary password and select **User must change password at next logon**.
5. Add the user to the appropriate department security group.
6. Use group-based access instead of assigning permissions directly to the user.
7. Confirm that the account is enabled and does not have an unintended expiration date.

### Microsoft 365

1. Create the cloud user and set the correct usage location.
2. Add the employee's job title, department, company and employee ID when supplied.
3. Assign the licence required for the role.
4. Add the user to approved security groups, Microsoft 365 groups and Teams.
5. Confirm that Security Defaults or the applicable MFA policy will require registration.
6. Avoid assigning an administrative role unless the request specifically requires it and has been approved.

### Verification and handoff

1. Have the employee sign in with the temporary password.
2. Confirm that the employee is required to create a private password.
3. Complete MFA registration when prompted.
4. Test Outlook, Teams, SharePoint, OneDrive and any required departmental shares.
5. Confirm that required resources are available and unrelated departmental resources are denied.
6. Record the completed checks in the ticket. Never record the user's password.

## Department transfer checklist

1. Confirm the new department, effective date and access requirements with the manager.
2. Record the user's current OU, department attribute and group memberships before changing them.
3. Move the user to the correct departmental OU.
4. Update the Department attribute and any other approved profile information.
5. Remove memberships that belong only to the previous department.
6. Add the correct security groups for the new department.
7. Update Microsoft 365 group and Team memberships as approved.
8. Have the user sign out and sign back in so a new access token is issued.
9. Remove obsolete mapped drives and map the correct departmental share.
10. Verify that the new resources are accessible and the former department's resources are denied.
11. Document the access removed, access granted and test results.

## Offboarding checklist

### Secure the account

1. Confirm the approved separation request and the exact time access must end.
2. Disable the Active Directory account at the authorized time.
3. Block Microsoft 365 sign-in and revoke active sessions.
4. Remove departmental security group, Microsoft 365 group and Team memberships.
5. Remove any administrative roles or delegated access.

### Preserve approved business data

1. Confirm mailbox and OneDrive retention requirements with the authorized manager.
2. If mailbox retention or delegation is required, convert the mailbox to a shared mailbox before removing the licence.
3. Grant Full Access only to the approved delegate. Add Send As only when the business request requires it.
4. Provide temporary OneDrive access to an authorized manager or administrator when required.
5. Remove the Microsoft 365 licence only after mailbox conversion and data-retention steps are complete.
6. Retain the user object when deleting it could affect access to the retained mailbox or data.

### Close the request

1. Verify that the former employee can no longer sign in.
2. Confirm that approved delegates can access retained business data.
3. Record every action, approval and verification result in the ticket.
4. Escalate any unclear retention, legal hold or ownership request before deleting data or accounts.

## Lab verification

This workflow was exercised through user creation, licence and group assignment, an HR-to-Finance transfer, removal of obsolete access, account blocking, session revocation, shared-mailbox conversion and post-change access testing.
