# Phase 3 — Blockchain Necessity Test

## Decision Rule

If the trust model still works almost as well with a normal central server plus signatures, the idea is not strong enough for this track.

## Necessity Test Table

| ID | Actors who do not fully trust one another | Shared proof needed | On-chain | Off-chain | Why not just a server? | Verdict |
| --- | --- | --- | --- | --- | --- | --- |
| P01 | Program issuer, approved merchant, auditor, possibly donor/funder | benefit credential validity, revocation state, redemption status, audit history | credential hash, revocation status, redemption record hash, timestamped audit checkpoint | PII, eligibility rules, merchant details, full program records | A single server owned by one actor does not give neutral shared auditability across issuer, merchant, and auditor; duplicate-redemption status and revocation are exactly the kind of shared state multiple semi-trusted actors need | GREEN |
| P04 | Exporter, certifier, buyer, auditor, sometimes logistics partner | authenticity and current validity of compliance and sustainability documents | document hashes, certifier attestations, revocation state, selected event checkpoints | full documents, commercial terms, supplier identities, sensitive operational data | A normal portal can work if one operator is fully trusted, but in cross-company document exchange there is still value in neutral proof and revocation. Still, the case is less unavoidable than P01 | YELLOW |
| P07 | Project developer, verifier, registry, buyer/funder | monitoring data provenance, report checkpoint history, verifier attestation | report hash, monitoring-batch hash, verifier attestation hash, issuance / status markers | raw sensor data, calculations, project metadata, sensitive commercial context | Signed logs and centralized audit tools can already cover much of this. Blockchain helps with independent auditability, but it is not uniquely necessary for a small pilot | YELLOW |

## Detailed Analysis

### P01 — Aid credential + redemption audit

#### Trust problem

The core trust issue is not just data storage. It is shared state across actors who can dispute whether:

- a credential was valid at redemption time
- a redemption already happened elsewhere
- a credential was revoked before use
- the audit trail was edited later

#### What belongs on-chain

- credential identifier hash
- revocation status
- redemption status or redemption event hash
- timestamped audit checkpoints

#### What stays off-chain

- beneficiary identity and attributes
- detailed eligibility logic
- merchant and program operational data
- any sensitive case history

#### Why blockchain passes

Blockchain is doing one sharp job: maintaining a tamper-resistant shared trust state across multiple organizations. That is a legitimate backend use for this track.

### P04 — Compliance passport for SME exporters

#### Trust problem

Exporter, buyer, and certifier need a common way to trust whether a document set is authentic and still valid.

#### What belongs on-chain

- document set hash
- certifier attestation hash
- revocation / expiry status
- optional event checkpoints

#### What stays off-chain

- full certificates
- commercial relationships
- sensitive supplier and volume data

#### Why blockchain is only partially essential

This is a good use case, but for a narrow pilot a trusted document portal plus signatures may be enough. Blockchain improves neutrality and auditability, but the necessity argument is weaker than P01.

### P07 — MRV audit trail for small climate projects

#### Trust problem

Project developer, verifier, registry, and buyer need confidence that submitted reports match prior monitoring data and were not silently changed.

#### What belongs on-chain

- monitoring-batch hash
- report hash
- verifier attestation hash
- status changes

#### What stays off-chain

- raw monitoring files
- calculations
- project documents
- sensitive business and location details

#### Why blockchain is only partially essential

Tamper-evident checkpoints help, but judges can reasonably ask why a signed append-only log is not enough. The necessity case is credible, but not as crisp as P01.

## Surviving Candidates

1. P01 — strong survive
2. P04 — survive with caution
3. P07 — survive with caution

## Rejection Logic Used Here

- Reject if on-chain data is not tightly scoped.
- Reject if blockchain does not change the trust model.
- Reject if the same effect can be explained just as clearly with a normal portal.

## Conclusion

P01 has the strongest blockchain necessity because the core product value is a shared redemption and revocation trust layer across semi-trusted actors.  
P04 and P07 remain credible, but both are more vulnerable to the judge question: `why not just use a normal server with signatures?`

