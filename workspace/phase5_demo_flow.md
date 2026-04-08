# Phase 5 — Demo Flow

## Demo Goal

Show one clean happy path and one duplicate-redemption failure in 90–120 seconds.

## Demo Setup

Deployment context:

- one university hardship meal support program
- one eligible student
- one approved campus cafeteria
- one issuer dashboard
- one auditor screen

## Primary User Flow

1. Issuer opens the admin panel and issues one hardship meal voucher credential for Student A.
2. Student A receives a wallet-free QR credential on a simple web pass or phone screen.
3. Cashier scans the QR.
4. Verification service checks off-chain program logic and on-chain shared voucher state.
5. Cashier sees `Valid` and clicks `Redeem`.
6. Redemption status is committed to the shared ledger.
7. Auditor screen shows the new immutable redemption checkpoint.

## Failure Case In Same Demo

8. Student A or the cashier attempts to redeem the same QR again.
9. Verification service reads on-chain redemption state.
10. Cashier sees `Already redeemed` and the transaction is blocked.
11. Auditor screen shows both the original redemption and the blocked duplicate attempt context.

## One Trust Moment Where Blockchain Appears

Right after the first redemption, the demo briefly shows:

- voucher hash
- redeemed status
- timestamped checkpoint

This is enough to make the trust layer visible without turning the demo into a blockchain tutorial.

## Suggested Timing

- 0–15 sec: problem framing
- 15–35 sec: issuer creates voucher
- 35–60 sec: student presents QR and merchant redeems
- 60–80 sec: blockchain trust moment
- 80–105 sec: duplicate redemption fails
- 105–120 sec: auditor confirms immutable history

## Metrics Slide Claim

`We reduce the operational risk of duplicate redemption by giving issuer, merchant, and auditor one shared redemption state instead of separate, editable records.`

## Non-Essential Demo Elements Removed

- full onboarding flow
- student profile management
- merchant onboarding workflow
- payment settlement
- donation or sponsor view
- analytics charts

