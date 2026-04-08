# Phase 8 — Demo Operator Script

## 90-120 Second Script

### 0-10 sec

`This is a university hardship meal voucher program. Student Affairs issues one QR pass, campus merchants redeem it, and auditors can inspect a shared history.`

### 10-25 sec

Open the Student tab and show the QR pass.

Say:

`The student never touches a wallet. The only thing they present is a QR credential.`

### 25-45 sec

Switch to Merchant.

Select `CAF-A` and `VCH-1001`.

Click `Verify`, then `Redeem`.

Say:

`At redemption time, we check merchant approval, voucher existence, and the shared state only. We do not re-evaluate hardship eligibility at checkout.`

### 45-60 sec

Show the checkpoint or audit marker.

Say:

`This redemption is now visible as a shared checkpoint for Student Affairs and auditors.`

### 60-80 sec

Click `Verify` or `Redeem` again on the same voucher.

Say:

`The second attempt is blocked because the shared state already says redeemed.`

### 80-95 sec

Switch to Auditor.

Show issued, redeemed, and blocked events.

Say:

`That is the trust layer: one state, one history, multiple actors.`

### 95-110 sec

If needed, show a revoked voucher or unauthorized merchant.

Say:

`We also block revoked vouchers and merchants who are not approved.`

### 110-120 sec

Close with pilot path.

Say:

`This can pilot on one campus with Student Affairs, one or two cafeterias, and finance review.`

## Operator Rules

- Start from reset state every time.
- Keep `VCH-1001` as the main happy-path voucher.
- Keep `CAF-A` as the approved merchant.
- Keep `CAF-X` ready for the unauthorized-merchant proof.
- Do not explain blockchain internals unless asked.

