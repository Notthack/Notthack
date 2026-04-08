# Phase 6 — Contract And Backend Plan

## Implementation Order

Follow this order:

1. shared state model
2. verify / redeem backend flow
3. merchant screen
4. issuer screen
5. student QR pass
6. auditor view

## Smallest Chain Interaction

The chain only needs to prove:

- voucher is active or revoked
- voucher has not been redeemed yet
- a redemption happened at a specific checkpoint

## Minimal Contract Surface

### Stored fields by voucher hash

- `isRevoked: bool`
- `isRedeemed: bool`
- `lastEventType: enum or string`
- `lastEventAt: timestamp`

### Contract methods

- `issueVoucher(voucherHash)`  
  Optional for demo. If omitted, issuance can remain off-chain and first on-chain write can happen at revocation or redemption checkpoint.
- `revokeVoucher(voucherHash)`
- `redeemVoucher(voucherHash)`
- `logOverride(voucherHash, overrideEventHash)`
- `getVoucherState(voucherHash)`

## Recommended MVP Decision

For the hackathon MVP, keep `issueVoucher` off-chain if needed.  
Minimum proof still works if the first mandatory on-chain write is `redeemVoucher`, because the key judge moment is preventing a second redemption.  
If time allows, add `issueVoucher` for cleaner end-to-end storytelling.

## Backend Responsibilities

### Verify endpoint

`POST /api/merchant/verify`

Input:

- `merchantId`
- `voucherId`

Logic:

1. confirm merchant is approved off-chain
2. resolve voucher record off-chain
3. derive voucher hash
4. read `getVoucherState(voucherHash)` on-chain
5. return:
   - `valid`
   - `revoked`
   - `already_redeemed`
   - `unknown_voucher`
   - `merchant_not_approved`

Important:

- do not recompute hardship eligibility here

### Redeem endpoint

`POST /api/merchant/redeem`

Input:

- `merchantId`
- `voucherId`

Logic:

1. run verify logic again server-side
2. if result is not `valid`, reject
3. write `redeemVoucher(voucherHash)` on-chain
4. persist off-chain receipt metadata
5. return success payload with checkpoint reference

### Revoke endpoint

`POST /api/issuer/revoke`

Input:

- `staffId`
- `voucherId`
- `reasonCode`

Logic:

1. verify staff role off-chain
2. write `revokeVoucher(voucherHash)` on-chain
3. store reason and notes off-chain

### Override log endpoint

`POST /api/issuer/override`

Input:

- `staffId`
- `voucherId`
- `overrideReason`

Logic:

1. approve override off-chain
2. hash override note / decision
3. call `logOverride(voucherHash, overrideEventHash)` on-chain
4. do not mutate redeemed / revoked state unless staff separately issues a replacement voucher

## Backend Storage Plan

Use fake but believable local seed data:

- `students.json`
- `vouchers.json`
- `merchants.json`
- `audit_events.json`

No real SIS, payment, or identity integrations.

## Demo-Safe Technical Choice

- use one simple contract
- use one backend service
- use one QR format
- use one merchant verification path

Avoid:

- multi-contract design
- async event indexing dependency as a hard requirement
- external auth integrations

