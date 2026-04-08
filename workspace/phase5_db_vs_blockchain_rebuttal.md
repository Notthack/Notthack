# Phase 5 — DB vs Blockchain Rebuttal

## 20-Second Answer

A normal server works if one department is the only trusted source of truth.  
This problem is different: student affairs, merchants, and auditors all depend on the same redemption and revocation state, and no single editable log is a strong enough neutral record when disputes or duplicate claims happen.  
We use blockchain only for that shared tamper-resistant state; everything else stays in normal databases.

## Shorter Backup Version

`Because the critical issue is not storage, it is shared trust over redemption and revocation across multiple semi-trusted actors.`

## Expanded Judge Answer

- We are not replacing the university database.
- We are only putting the minimum cross-actor trust state on-chain.
- If Student Affairs alone owns an editable server log, the auditor and merchant still have to trust that nothing was changed after the fact.
- Blockchain gives one neutral checkpoint for `valid`, `revoked`, and `already redeemed`.

## Anti-Overclaim Note

Do not claim that blockchain solves eligibility assessment, identity proof, or all fraud.  
Claim only that it makes shared voucher state and audit checkpoints harder to dispute or edit later.

