# Phase 6 — State Machine

## Voucher States

Only these states are used:

- `active`
- `revoked`
- `redeemed`

`override_logged` is **not** a state.  
It is a separate audited event.

## State Transitions

| From | Event | To | Allowed? | Notes |
| --- | --- | --- | --- | --- |
| none | voucher issued | active | Yes | Initial issuance |
| active | voucher redeemed | redeemed | Yes | Happy path |
| active | voucher revoked | revoked | Yes | Staff action |
| active | override logged | active | Yes | No state change; audit event only |
| redeemed | override logged | redeemed | Yes | Audit only |
| revoked | override logged | revoked | Yes | Audit only |
| redeemed | voucher redeemed again | redeemed | No second state change | Blocked duplicate attempt |
| revoked | voucher redeemed | revoked | No | Blocked invalid redemption |
| redeemed | voucher revoked | redeemed | No | Not needed for MVP |
| revoked | voucher reactivated | active | No | Out of scope for MVP |

## Event List

Minimum event set:

- `voucher_issued`
- `voucher_redeemed`
- `voucher_redemption_blocked`
- `voucher_revoked`
- `override_logged`

## Source Of Truth Split

- Off-chain source of truth:
  - voucher metadata
  - student record
  - merchant roster
  - program rules
- On-chain source of truth:
  - revocation status
  - redeemed status
  - event checkpoints

## State Read Rules

### Issuer reads

- off-chain voucher record
- on-chain state summary

### Merchant reads

- off-chain merchant approval
- off-chain voucher lookup
- on-chain state summary

### Auditor reads

- off-chain event metadata
- on-chain checkpoints

## Block Conditions

Merchant redemption must be blocked if:

- voucher ID does not exist off-chain
- merchant is not approved
- on-chain state is `revoked`
- on-chain state is `redeemed`

## Why This State Machine Is Safe For Demo

- small enough to implement quickly
- duplicate-redemption case is explicit
- revocation case can be added without changing structure
- override remains auditable without complicating the main state model

