# Phase 6 — System Spec

## Fixed Context

One university hardship meal voucher program for one campus, redeemable at approved campus cafeterias.

## Product Boundary

This MVP is not a general aid platform.  
It is a minimal shared trust layer for voucher issuance, revocation, redemption, duplicate-redemption blocking, and audit checkpoints.

## Core Rule

Eligibility is decided by Student Affairs before issuance or revocation.  
At redemption time, the system does **not** recompute hardship eligibility.

## System Components

### 1. Issuer App

Used by Student Affairs staff to:

- issue a voucher
- revoke a voucher
- log a manual override decision

### 2. Student Pass

Wallet-free QR pass that contains:

- voucher ID
- signed payload reference
- minimal display text such as `Meal Support Voucher`

### 3. Merchant App

Used by cafeteria cashier to:

- scan QR
- verify voucher validity
- redeem voucher
- see duplicate-redemption rejection

### 4. Verification / Redemption Backend

The orchestration layer that:

- validates merchant approval off-chain
- resolves voucher record off-chain
- checks on-chain voucher state
- writes redemption or revocation events to chain
- writes auditable override event hashes to chain

### 5. Audit View

Read-only screen showing:

- voucher event timeline
- latest shared state
- checkpoint references

### 6. Smart Contract / Ledger

Stores only:

- voucher active / revoked state
- redeemed state
- event checkpoints for redemption, revocation, and override logging

## Redemption-Time Logic

The merchant flow checks only:

1. merchant is approved off-chain
2. QR maps to a known voucher off-chain
3. on-chain state is `active`
4. on-chain state is not `revoked`
5. on-chain state is not `redeemed`

The merchant flow does **not**:

- recompute hardship eligibility
- read hardship assessment reasons
- access full student records

## Minimal End-to-End Happy Path

1. Staff issues voucher to one student.
2. Student receives QR pass.
3. Merchant scans QR.
4. Backend verifies merchant + voucher mapping off-chain and voucher state on-chain.
5. Merchant clicks redeem.
6. Backend writes redemption event to chain.
7. Auditor sees the new immutable checkpoint.

## Duplicate-Redemption Failure Path

1. Same QR is scanned again.
2. Backend reads on-chain state.
3. State is already `redeemed`.
4. Merchant sees rejection.
5. No second redemption is written.

## Manual Override Rule

Manual override = off-chain staff approval + on-chain override event logging.

This means:

- override approval happens in Student Affairs workflow
- the decision itself remains human-controlled
- the fact that an override occurred is checkpointed on-chain for auditability

## Assumptions

- One voucher supports one meal redemption in the demo.
- Merchant roster is hardcoded or stored in seed data for the hackathon.
- Student pass can be a browser page showing a QR rather than a native mobile app.

