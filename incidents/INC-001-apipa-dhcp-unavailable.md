# INC-001: Domain Client Received an APIPA Address

| Field | Details |
| --- | --- |
| Date | August 23, 2026 |
| System | `NOVA-WS01` |
| Service | DHCP and network connectivity |
| Severity | Medium |
| Impact | One domain client could not obtain its normal network configuration |
| Status | Resolved |

## Problem

`NOVA-WS01` did not receive an address from the `10.10.10.0/24` lab network. Windows assigned an APIPA address instead, which indicated that the client had not received a response from a DHCP server.

## Investigation

1. Reviewed the client's IP configuration and identified the APIPA address.
2. Confirmed that the VirtualBox NAT network was configured with its built-in DHCP service disabled intentionally.
3. Confirmed that DHCP for the lab was hosted on `NOVA-DC01`.
4. Checked the VM state and found that `NOVA-DC01` was powered off.
5. Determined that no DHCP server was available to answer the client's broadcast request.

## Root cause

`NOVA-DC01`, which hosted the lab's DHCP and DNS services, was powered off when `NOVA-WS01` started. Because VirtualBox DHCP was disabled by design, there was no second DHCP service available. Windows therefore assigned an APIPA address to the client.

## Resolution

1. Started `NOVA-DC01` and allowed the server services to become available.
2. Allowed `NOVA-WS01` to request a new DHCP lease.
3. Confirmed that the client received an address from the configured scope.

## Verification

The client received the expected network settings:

| Setting | Verified value |
| --- | --- |
| IPv4 scope | `10.10.10.100` to `10.10.10.200` |
| Default gateway | `10.10.10.1` |
| DNS server | `10.10.10.10` |
| DNS suffix | `corp.novacore.test` |

Windows detected the network and normal domain connectivity was restored.

## Prevention

- Start `NOVA-DC01` and wait for its services before starting the client VM.
- Check the availability of required infrastructure services before changing the client configuration.
- Treat an APIPA address as evidence that DHCP failed, not as the root cause by itself.
- Keep the lab startup order documented: domain controller first, client second.

## Key takeaway

The client network adapter was not the underlying problem. The failure came from an unavailable infrastructure dependency. Checking where DHCP was supposed to come from led directly to the cause and avoided unnecessary changes to the Windows client.
