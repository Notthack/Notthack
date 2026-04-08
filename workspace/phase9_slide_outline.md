# Phase 9 — Slide Outline

## Slide 1 — Problem

- University hardship meal support is hard to administer cleanly across Student Affairs, merchants, and auditors
- Duplicate redemption, stale eligibility, and reconciliation friction create trust problems
- The current workflow is operationally fragile, not just inconvenient

## Slide 2 — Who Suffers

- Student Affairs staff who issue and revoke support
- Campus cafeteria cashiers who need a fast yes/no answer
- Auditors who need a reliable history
- Eligible students who should not be forced through crypto UX

## Slide 3 — Why Current Workflow Fails

- Eligibility decisions live in one place, but redemption happens in another
- Editable lists and manual reconciliation create dispute risk
- A single department-owned log is not a neutral shared record

## Slide 4 — Solution

- Wallet-free QR voucher for one campus hardship program
- Merchant verify/redeem flow
- Auditor-visible event history
- Blockchain used only for revocation, redemption state, and audit checkpoints

## Slide 5 — Why Blockchain Here

- Multiple semi-trusted actors need the same redemption state
- Revocation and duplicate redemption are the trust problem
- Off-chain data stays private; on-chain state stays minimal

## Slide 6 — Demo

- Issue or reuse seeded voucher
- Student presents QR pass
- Merchant verifies and redeems
- Duplicate redemption is blocked
- Auditor sees the meaningful history

## Slide 7 — Deployment Path

- Pilot one campus with Student Affairs and 1–2 cafeterias
- Keep eligibility off-chain and staff-owned
- Expand only after the voucher trust model proves itself

## Slide 8 — Responsible Design

- No wallet required
- Personal data off-chain
- Manual override is human-controlled and logged
- Offline, biometrics, and complex integrations are out of scope

## Slide 9 — Closing

- This is a shared trust layer, not a voucher app
- The team proved the minimum viable trust state
- Ask: pilot this with one university program

