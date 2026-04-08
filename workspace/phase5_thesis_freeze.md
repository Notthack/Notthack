# Phase 5 — Thesis Freeze

## Fixed Deployment Context

`University hardship meal support vouchers redeemable at approved campus cafeterias`

Reason for choosing this context:

- more concrete than “municipality or NGO”
- easier to explain in one minute
- pilot path is more plausible immediately
- still preserves the same trust problem: issuer, merchant, auditor, and beneficiary do not share one trustworthy redemption state

## Frozen Thesis

University hardship meal support programs cannot reliably prevent duplicate redemption and misuse because eligibility validity, revocation, and redemption records are fragmented across student affairs, campus merchants, and auditors.

We provide a wallet-free QR benefit credential that keeps student personal data off-chain while using blockchain only for shared redemption state, revocation, and audit checkpoints.

## 3-Sentence Pitch

Students receiving hardship meal support should be able to redeem help with the same simplicity as showing a QR code, without learning crypto or exposing their personal data to every merchant.  
Today, issuers, campus merchants, and finance auditors often rely on fragmented lists and reconciliation, which makes duplicate redemption, stale eligibility, and audit friction hard to control.  
Our system issues a simple QR credential to the student and uses blockchain only to share revocation, redemption state, and audit checkpoints across the actors who need trusted, tamper-resistant records.

## Scope Freeze Statement

This is not an “aid platform.”  
This MVP is only a minimal shared trust layer for one hardship meal voucher program at one university campus.

## Non-MVP Features Explicitly Cut

These are intentionally out of scope:

1. direct crypto payments or stablecoin settlement
2. multi-university federation
3. reusable national identity integration
4. donor dashboard and donation flow
5. advanced analytics dashboards
6. mobile app store deployment
7. biometric identity verification
8. loyalty or reward mechanics
9. multi-benefit program support
10. automated fraud scoring

