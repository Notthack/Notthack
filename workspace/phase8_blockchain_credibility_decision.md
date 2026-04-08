# Phase 8 — Blockchain Credibility Decision

## Decision

Keep the current local ledger abstraction.  
Do **not** add a minimal real-chain checkpoint for the main demo.

## Why

1. The BGA judge cares more about whether blockchain is necessary than whether the demo hits a live network.
2. The current build already proves the trust model: shared redemption state, revocation, audit checkpoints, and override logging.
3. A real-chain adapter would increase demo risk and distract from the tight campus workflow story.
4. The project is stronger when the blockchain appears only as the trust layer, not as the thing the operator has to debug live.

## Judge-Safe Wording

Use this wording in the pitch and demo:

`For the hackathon, we use a demo-safe ledger abstraction to represent the shared on-chain state. The important part is the trust model: revocation, redemption status, and audit checkpoints are shared across Student Affairs, merchants, and auditors.`

Do not say:

- `we deployed a production blockchain`
- `the chain solves everything`
- `eligibility is on-chain`
- `the voucher app is decentralized`

## If Judges Push Hard

Say:

`We intentionally kept the demo safe and deterministic. The production mapping is straightforward, but the hackathon proof is the cross-actor trust model, not network complexity.`

## Final Credibility Assessment

Acceptable as-is.  
A real-chain checkpoint is not worth the added failure risk for this submission.

