# Phase 6 — UI Task Breakdown

## UI Delivery Principle

Build only the screens required to support the 90–120 second demo.

## UI Priority Order

### 1. Merchant Screen

Why first:

- highest demo risk
- directly proves the shared-state model
- duplicate-redemption failure happens here

Must have:

- QR input or paste field
- `Verify` action
- status card: valid / revoked / already redeemed / unknown
- `Redeem` button only when valid
- success message with checkpoint reference
- blocked duplicate-redemption message

### 2. Issuer Screen

Must have:

- issue voucher for one seeded student
- revoke voucher
- log manual override event
- simple list of issued vouchers

Can be fake-admin simple:

- dropdown for student
- one `Issue voucher` button
- one `Revoke` button

### 3. Student QR Pass

Must have:

- voucher label
- student display name or masked identifier
- QR code

Should not have:

- wallet connect
- crypto addresses
- chain details

### 4. Auditor View

Must have:

- voucher event timeline
- current state snapshot
- visible event types:
  - issued
  - redeemed
  - redemption blocked
  - revoked
  - override logged

## UI Tasks By Build Order

### Merchant screen tasks

1. create scan / paste voucher input
2. connect verify API
3. show status states
4. connect redeem API
5. show duplicate-redemption block clearly

### Issuer screen tasks

1. issue voucher action
2. revoke voucher action
3. override log action
4. basic voucher list

### Student pass tasks

1. render seeded voucher
2. generate QR
3. show minimal voucher label

### Auditor view tasks

1. read event log
2. show current state
3. show last checkpoint reference

## Explicit Cuts

- merchant analytics
- student login
- role management UI
- responsive perfection beyond demo-safe layouts
- full settings screens
- audit filtering and search

