# Phase 8 — UI Fix List

## Judge-Facing UI Fixes Applied

1. Reworded the hero so the trust problem is visible before any interaction.
2. Added a visible demo rail to cue the operator and the judge toward the intended story arc.
3. Added a `Shared trust checkpoint` box in the merchant area so the blockchain moment appears during verify/redeem instead of only in narration.
4. Kept one seeded merchant and one seeded voucher selected by default through the bootstrap flow.
5. Strengthened the student pass so it reads as a wallet-free pass, not a developer placeholder.
6. Made issuer copy explicit that eligibility is decided before checkout and stays off-chain.
7. Kept the auditor view focused on meaningful event types only: issued, redeemed, blocked, revoked, override.
8. Made reset and replay operator-safe through session bootstrap and visible reset controls.

## Visual State Clarity

States that must be obvious on screen:

- `valid`
- `redeemed`
- `already_redeemed`
- `revoked`
- `merchant_not_approved`

Current decision:

- good states use a success tone
- blocked states use a danger tone
- checkpoint visibility is tied to the merchant result and auditor timeline

## What Was Intentionally Not Added

- no analytics widgets
- no extra navigation
- no blockchain explorer panel
- no wallet or token badges
- no second demo path competing with the main story

## Remaining UI Risks

1. The interface is credible and clear, but still more operational than memorable.
2. The auditor panel depends on narration to feel central; the operator should always call it the trust layer.
3. The pseudo-QR is demo-safe, but judges should not be invited into QR implementation details.

## Operator Guidance

- reset before the live run
- show the student pass first
- redeem once before talking about the checkpoint
- keep the auditor panel for the duplicate-redemption moment
