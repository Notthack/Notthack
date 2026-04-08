# Phase 4 — Shortlist and Recommendation

## Final Ranked Shortlist

Scores are 1–5 on each dimension.

| ID | Concept | Problem clarity | Blockchain necessity | Practicality | Impact potential | UX simplicity | Responsible design | Demoability in 48h | Path to pilot | Distinctiveness | Total / 45 | Rank |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| P01 | Aid credential + redemption audit | 5 | 5 | 5 | 5 | 4 | 4 | 5 | 4 | 4 | 41 | 1 |
| P04 | Compliance passport for SME exporters | 4 | 4 | 4 | 4 | 5 | 4 | 4 | 4 | 4 | 37 | 2 |
| P07 | MRV audit trail for small climate projects | 4 | 4 | 3 | 5 | 5 | 4 | 3 | 3 | 4 | 35 | 3 |

## Recommended Concept

### Chosen concept

`P01 — Aid credential + redemption audit`

### One-sentence thesis

Municipalities and NGOs cannot reliably prevent duplicate or fraudulent benefit redemption because eligibility proof, revocation, and redemption logs are fragmented across issuers, merchants, and auditors.  
We solve this with a QR-based aid credential and redemption verifier, using blockchain only for revocation, shared redemption status, and audit checkpoints.

## Why This Wins Relative To The Others

### 1. Best match to BGA's visible preferences

It sits directly in public digital infrastructure, anti-fraud, inclusion, and digital trust. It also resembles the kind of operational transparency problem that BGA-adjacent examples such as `Rahat` already validate.

### 2. Strongest blockchain necessity

This is the cleanest case where a shared tamper-resistant state matters across semi-trusted actors. The blockchain job is narrow and defensible.

### 3. Judge-friendly story

The pitch is easy:

- vulnerable people need benefits
- issuers and merchants need trust
- fraud and duplicate redemption are real
- the user does not need crypto knowledge

### 4. Demo-friendly

A 90–120 second demo can show:

1. issuer creates a credential
2. beneficiary presents QR
3. merchant verifies and redeems
4. second attempt is blocked
5. auditor sees the immutable checkpoint

### 5. Responsible-design upside

The privacy posture is straightforward:

- keep PII off-chain
- store only hashes, revocation, and redemption proofs on-chain
- provide a clear manual override / appeal story later

## Why The Other Finalists Were Not Chosen

### P04 — Compliance passport for SME exporters

Why it is good:

- real regulatory pull
- strong product-market story
- non-crypto UX is easy

Why it loses to P01:

- can drift into “enterprise compliance dashboard” territory
- blockchain necessity is good but less sharp
- the emotional and social impact is less immediate in a short pitch

### P07 — MRV audit trail for small climate projects

Why it is good:

- high policy relevance
- clear sustainability fit
- strong impact framing

Why it loses to P01:

- harder to explain quickly
- more vulnerable to `why not signed logs?`
- sensor truth versus log integrity can distract the demo and dilute the story

## Clear Rejection Logic For The Wider Problem Bank

Rejected because blockchain was decorative or too weak:

- P16, P19, P20

Rejected because they match known anti-patterns:

- P17

Rejected because UX or regulation dominates more than trust design:

- P18

Rejected because scope or governance complexity is too high for this stage:

- P03, P05, P08, P14

Rejected because the story is weaker than the finalists:

- P02, P06, P09, P10, P11, P12, P13, P15

## Recommendation For The Next Run

Freeze around this concept:

- target user: municipality or NGO program operator
- beneficiary UX: QR or simple mobile/pass presentation, no wallet
- verifier UX: merchant scan + success/failure result
- blockchain scope: revocation + redemption status + audit checkpoint only

Do not broaden into:

- token incentives
- direct crypto payments
- multi-program national identity scope
- donor-facing donation transparency

## Success Condition Reached

- 15+ candidate problems generated: yes
- top 3 validated with evidence: yes
- blockchain necessity tested explicitly: yes
- 1 final recommended concept selected: yes
- rejection reasons recorded: yes

