# Phase 5 — Failure Case

## Chosen Failure Case

`Duplicate redemption attempt using an already redeemed voucher`

## Why This Failure Case

- directly proves the core trust problem
- is easy for judges to understand instantly
- makes blockchain necessity visible
- is stronger than a generic “network error” or “invalid QR” case

## Failure Flow

1. Voucher is successfully redeemed once by the approved cafeteria cashier.
2. The same QR is scanned again.
3. Verification service checks the shared redemption state.
4. The system returns `Rejected: voucher already redeemed`.
5. The cashier is blocked from completing the second redemption.
6. Auditor can see the original redemption checkpoint and the attempted second action context.

## What The Judge Should Learn

- the problem is not just credential issuance
- the key value is shared state after issuance
- duplicate use can be blocked even if separate actors are involved

## Manual Override / Appeal Note

If the rejection happened because of an administrative error rather than real duplicate use, Student Affairs can issue a one-time override decision.  
That override should be logged as a separate audited event and should require staff action, not merchant discretion.

## What We Are Not Trying To Show

- complex fraud scoring
- identity-proof edge cases
- QR hardware reliability
- offline device sync

