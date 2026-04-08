# Phase 5 — Actor Model

## Minimum Actor Set

### 1. Issuer

`University Student Affairs Office`

Role:

- decides student eligibility
- issues or revokes meal voucher credentials
- reviews manual override cases

### 2. Beneficiary

`Eligible student`

Role:

- receives a QR-based voucher credential
- presents QR at checkout
- does not need a wallet or crypto knowledge

### 3. Merchant

`Approved campus cafeteria cashier`

Role:

- scans student QR
- sees approve / reject result
- submits redemption request

### 4. Auditor

`University finance / compliance reviewer`

Role:

- verifies that issued, redeemed, revoked, and blocked events match the immutable checkpoint history
- is not required in the happy path, but is required for the trust model

## Why This Is The Minimum

- Without the issuer, there is no eligibility or revocation authority.
- Without the merchant, there is no real redemption event.
- Without the beneficiary, there is no end-user UX to judge.
- Without the auditor, the blockchain trust story becomes weaker and starts looking like ordinary workflow software.

## Trust Boundaries

- Issuer does not want merchants to redeem stale or duplicated credentials.
- Merchant does not want liability for honoring an invalid benefit.
- Auditor does not want to trust edited server logs from a single department.
- Beneficiary should not expose private eligibility details to the merchant.

## Manual Override / Appeal Note

If a student is wrongly blocked because of stale eligibility sync, damaged QR, or administrative error, the issuer can issue a one-time manual override token off-chain and log the override decision as a separate audit event.  
The override is an exception path only, not part of the default demo flow.

