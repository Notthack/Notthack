# Phase 6 — Acceptance Tests

## Demo-Critical Acceptance Tests

### AT-01 Happy path verification

Given:

- approved merchant `CAF-A`
- seeded voucher `VCH-1001`
- on-chain state `active and not redeemed`

When:

- merchant verifies the QR

Then:

- result is `valid`
- redeem button is shown

### AT-02 Happy path redemption

Given:

- AT-01 passed

When:

- merchant clicks `Redeem`

Then:

- backend writes redemption event on-chain
- off-chain receipt metadata is stored
- UI shows success with checkpoint reference

### AT-03 Duplicate-redemption block

Given:

- voucher `VCH-1001` has already been redeemed once

When:

- merchant verifies or redeems the same voucher again

Then:

- result is `already_redeemed`
- no second redemption write occurs
- blocked state is shown clearly in UI

### AT-04 Revoked voucher block

Given:

- issuer revoked a seeded voucher

When:

- merchant verifies the revoked voucher

Then:

- result is `revoked`
- redeem action is unavailable

### AT-05 Unauthorized merchant block

Given:

- merchant `CAF-X` is not approved

When:

- that merchant attempts verification

Then:

- result is `merchant_not_approved`

### AT-06 Auditor visibility

Given:

- one voucher has been redeemed

When:

- auditor opens the audit view

Then:

- event timeline shows issued and redeemed records
- current state is visible
- checkpoint reference is visible

### AT-07 Override logging

Given:

- staff approves a manual override off-chain

When:

- issuer logs the override event

Then:

- override event hash is written on-chain
- auditor can see that an override occurred
- core voucher state remains unchanged unless another explicit staff action occurs

## Definition Of Phase 6 Success

- one happy path works locally
- duplicate-redemption failure works locally
- revoked-voucher block works
- unauthorized-merchant block works
- auditor can see immutable checkpoints
- no wallet is required for the student flow

