# Phase 8 — Demo Polish Plan

## Demo Polish Goal

Make the live demo unmistakable in under 2 minutes.

## UI Risks To Polish In Presentation

1. The hero must say the trust problem more directly.
2. The blockchain moment must be visible without becoming a blockchain tutorial.
3. The auditor view must look essential, not ornamental.
4. The student QR pass must look like a real pass, not a dev artifact.
5. The reset path must be fast enough for live use.

## Demo Hardening Actions

- keep one seeded voucher selected by default
- keep one approved merchant selected by default
- make the `redeemed`, `revoked`, and `already_redeemed` states visually distinct
- keep the auditor view on-screen during the duplicate-redemption moment
- use a visible checkpoint label for the redemption event
- have a reset step that restores the demo in one click

## Visual Polish Priorities

- clarify the role labels
- increase contrast on state badges
- make the student pass visually stronger
- make the checkpoint area prominent
- reduce technical clutter in the merchant console

## What Not To Polish

- no analytics charts
- no extra dashboards
- no multi-campusing
- no additional wallet flows
- no blockchain jargon expansion

## Live Demo Reliability

The operator should be able to:

- reset the demo
- issue or reuse the seeded voucher
- verify
- redeem
- show duplicate block
- show revoked block
- show unauthorized merchant block
- show audit history

without needing any hidden state recovery.

