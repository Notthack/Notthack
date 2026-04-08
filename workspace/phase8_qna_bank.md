# Phase 8 — Q&A Bank

## Why not just use a normal database?

Because the problem is not storage. The problem is a shared trust state across Student Affairs, merchants, and auditors. A single editable server log still leaves room for disputes about who changed what and when.

## Why is blockchain necessary here?

Only for the minimum shared state: revocation, redemption, and audit checkpoints. Those are exactly the records that multiple semi-trusted actors need to agree on without trusting one editable database owner.

## Why is this not just another voucher app?

It is not a general voucher app. It is a trust layer for one campus hardship program, built around duplicate-redemption prevention, revocation, and auditability.

## How would this be piloted in a university?

Start with one Student Affairs office and one or two campus cafeterias. Keep eligibility decisions inside the office, issue QR passes, and let the finance or compliance team review the event history.

## What data is on-chain vs off-chain?

On-chain: voucher state, redemption state, audit checkpoints, override event hashes.  
Off-chain: student identity, hardship assessment, merchant roster, program rules, and receipt details.

## What happens if a student is wrongly blocked?

Student Affairs can review the case and issue a manual override off-chain. The override itself is logged on-chain so the exception remains auditable.

## What happens if there is no internet?

For the hackathon demo, we do not rely on offline redemption. The live flow assumes connectivity. That is acceptable because the goal is to prove the trust model, not solve offline operations.

## How would it scale beyond one campus?

The same pattern can extend to additional cafeterias or campuses by reusing the issuer, merchant, and audit roles. The next step would be to map the shared state to a real chain or consortium setup after the pilot proves value.

## Why is this practical for non-crypto users?

Students only see a QR pass. Merchants only scan and redeem. Nobody needs a wallet, bridge, or token knowledge.

## What makes this responsible?

It avoids storing sensitive eligibility data on-chain, keeps staff in control of exceptions, and limits blockchain to the trust state where it is actually useful.

## What is the hardest judge objection?

`Why not a normal database?`  
Answer: because the auditor and merchant need a neutral shared record that no single department can quietly rewrite.

