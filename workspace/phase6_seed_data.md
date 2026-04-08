# Phase 6 — Seed Data

## Seed Data Principle

Use fake but believable campus data.  
No real university integration is required.

## Seed Entities

### Program

- `programId`: `meal-support-2026`
- `programName`: `University Hardship Meal Support`
- `voucherType`: `single_meal`
- `issuerOrg`: `Student Affairs Office`

### Students

#### Student A

- `studentId`: `STU-1001`
- `displayName`: `Aisha K.`
- `status`: `eligible`
- `notes`: `seeded demo beneficiary`

#### Student B

- `studentId`: `STU-1002`
- `displayName`: `Ravi M.`
- `status`: `not_issued`

### Merchants

#### Merchant 1

- `merchantId`: `CAF-A`
- `name`: `Campus Cafeteria A`
- `approved`: `true`

#### Merchant 2

- `merchantId`: `CAF-B`
- `name`: `Campus Cafeteria B`
- `approved`: `true`

#### Merchant 3

- `merchantId`: `CAF-X`
- `name`: `Unauthorized Stall`
- `approved`: `false`

### Voucher

Primary demo voucher:

- `voucherId`: `VCH-1001`
- `studentId`: `STU-1001`
- `programId`: `meal-support-2026`
- `displayLabel`: `Meal Support Voucher`
- `statusOffchain`: `issued`
- `voucherHash`: derived at runtime

## Seed Scenarios

### Happy path

- Voucher `VCH-1001` is active and not redeemed.
- Merchant `CAF-A` verifies and redeems it successfully.

### Failure path

- Same voucher `VCH-1001` is presented again.
- Merchant sees `already redeemed`.

### Optional revoke path

- Issuer revokes a second seeded voucher before merchant scan.

### Optional override path

- Issuer logs a manual override event for audit visibility.

## Seed Data Files

- `program.json`
- `students.json`
- `merchants.json`
- `vouchers.json`
- `audit_events.json`

## Why This Seed Data Is Enough

- covers one end-to-end happy path
- covers duplicate-redemption failure
- supports issuer, merchant, student, and auditor screens
- avoids dependency on real infrastructure

