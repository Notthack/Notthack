# Phase 2 — Problem Validation

## Validation Method

Questions used:

1. Is the user real and easy to describe?
2. Is the failure frequent, expensive, risky, or unfair?
3. Is there evidence from credible public sources?
4. Is the problem narrow enough for a hackathon demo?
5. Is the problem already solved well enough by normal software?

## Top 3 Validation Table

| ID | Problem | User reality | Harm / urgency | Evidence quality | Narrow enough for demo? | Solved well enough already? | Validation decision |
| --- | --- | --- | --- | --- | --- | --- | --- |
| P01 | Aid voucher double redemption and impersonation | Very clear: municipality or NGO program operator, approved merchant, beneficiary, auditor | High: cash disbursement, fraud, exclusion, manual reconciliation | Strong | Yes | No; current systems are fragmented across actors | GREEN |
| P04 | Compliance passport for SME exporters | Clear: SME exporter, certifier, buyer, auditor | High: export friction, repeated document exchange, green claim risk | Strong | Yes | Partly; existing systems exist but are fragmented across organizations | GREEN |
| P07 | MRV audit trail for small carbon or renewable projects | Clear: project developer, verifier, registry, buyer | Medium-high: reporting credibility and verification cost | Strong | Yes, if narrowed to one report flow | Partly; digital MRV exists, but shared tamper-evident audit remains uneven | GREEN |

## Evidence Log

### P01 — Aid voucher double redemption and impersonation

Why it is real:

- The World Bank states that approximately 850 million people still lack official ID and around 85 million unbanked adults still receive government payments in cash. That is direct evidence that identity and benefit delivery remain operational problems, not abstract policy topics.
- The same World Bank DPI page emphasizes inclusive ID, data sharing, and G2P payments as foundational public infrastructure, which matches this problem closely.
- Rumsan's `Rahat` is a real open-source cash and voucher assistance system for vulnerable communities, showing that humanitarian agencies already treat transparent distribution and transaction monitoring as a real deployment need.

Why it is narrow enough:

- A hackathon demo can focus on one benefit program, one approved merchant, one beneficiary credential, one redemption, and one duplicate-redemption failure case.

Why not solved already:

- Single-program software exists, but the core failure is cross-actor trust, revocation, and audit across issuer, merchant, and auditor, especially in lower-capacity deployments.

### P04 — Compliance passport for SME exporters

Why it is real:

- The European Commission states the ESPR will introduce a Digital Product Passport as a digital identity card for products, components, and materials, explicitly to support sustainability and legal compliance.
- GS1 EPCIS already standardizes supply-chain event sharing, which confirms this is a real operational space, not a speculative one.
- Plastiks is an official example of blockchain-based verification and traceability for sustainability data, which is directionally similar and publicly marketed as Web2-friendly.

Why it is narrow enough:

- A demo can focus on a single product, one certifier-issued document set, one buyer scan, one verification screen, and one revoked certificate case.

Why not solved already:

- ERP tools and document portals exist, but SMEs still face fragmented requests, inconsistent proof formats, and revocation challenges across counterparties.

### P07 — MRV audit trail for small carbon or renewable projects

Why it is real:

- UNFCCC states that reporting and review requirements under MRV and the Enhanced Transparency Framework are core to credibility and accountability in climate action.
- Japan's Ministry of the Environment publicly sought operators for a J-Credit MRV support system, which is direct evidence of institutional demand for better MRV workflows.
- Japan's MRV library explicitly positions MRV as the measurement, reporting, and verification process used to quantify emissions and reductions.

Why it is narrow enough:

- A hackathon demo can use one simulated monitoring data set, one report export, one on-chain checkpoint, and one tamper detection case.

Why not solved already:

- Digital MRV tools exist, but the trust problem remains split across project developer, verifier, registry, and buyer. Still, this space is more technical and explanation-heavy than P01.

## Do Not Pursue List

These remain interesting but should not proceed now:

- P02: too close to P01, but weaker as a standalone story
- P03: privacy and cross-agency matching complexity are high for a hackathon
- P05: sensor trust and cold-chain hardware push scope up too early
- P06: solid space, but can collapse into ESG-dashboard territory unless sharply defined
- P08: claims logic and insurer workflow complexity are too high for Phase 4 selection
- P09: real need, but lower BGA distinctiveness than stronger institutional trust cases
- P10: lender adoption story is weaker than public-benefit or compliance cases
- P11: promising, but procurement proof is less visually distinctive than P01
- P12: may look like generic workflow software unless framed very tightly
- P13: timely, but consumer verification UX and issuer partnerships are harder to make credible quickly
- P14: governance and false-positive risk are too high for a short hackathon
- P15: interesting, but lower urgency than the top three

## Conclusion

The best validated problems are:

1. P01 — aid credential + redemption audit
2. P04 — compliance passport for SME exporters
3. P07 — MRV audit trail for small climate projects

These move forward because they are all:

- institutionally real
- evidence-backed
- narrow enough for a believable demo
- plausible fits for BGA's public-interest framing

## Sources

- World Bank DPI: https://www.worldbank.org/en/results/2023/10/12/creating-digital-public-infrastructure-for-empowerment-inclusion-and-resilience
- World Bank ID4D: https://blogs.worldbank.org/en/digital-development/850-million-people-globally-dont-have-id-why-matters-and-what-we-can-do-about
- Rahat: https://rumsan.com/portfolio/rahat
- European Commission ESPR / DPP: https://commission.europa.eu/energy-climate-change-environment/standards-tools-and-labels/products-labelling-rules-and-requirements/sustainable-products/ecodesign-sustainable-products-regulation_en
- GS1 EPCIS: https://ref.gs1.org/standards/epcis/2.0.1/
- Plastiks technology: https://www.plastiks.io/our-technology
- UNFCCC reporting and review: https://unfccc.int/reporting-and-review
- Japan MOE MRV support system: https://www.env.go.jp/press/press_03380.html
- Japan MRV library: https://www.env.go.jp/earth/ondanka/ghg/mrv-library/1.whats_mrv.html
