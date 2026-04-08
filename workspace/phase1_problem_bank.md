# Phase 1 — Problem Bank

## Filter Rule

- `GREEN` = strong candidate for later validation
- `YELLOW` = plausible but needs caution
- `RED` = reject early

## Candidate Problem Bank

| ID | Domain | Candidate problem | Target user | Exact pain | Current workaround | Why current system fails | Why this matters now | Initial blockchain fit guess | Status |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| P01 | Public digital infrastructure / anti-fraud | Aid voucher double redemption and impersonation | Municipality or NGO benefit operator | Cannot reliably stop duplicate or fraudulent redemptions across merchants and programs | Paper vouchers, spreadsheets, separate merchant logs | Fragmented records, weak audit trail, manual reconciliation | Cash G2P and lack of ID still affect large populations | Strong: shared redemption + revocation log | GREEN |
| P02 | Public digital infrastructure | Merchant/payee credential registry for public benefit disbursement | Program operator and approved merchant | Hard to verify that the person or merchant redeeming a subsidy is actually authorized | Manual merchant onboarding, phone confirmation, local lists | Lists go stale, fraud and collusion are hard to audit | Digital cash transfer programs are expanding | Medium: credential revocation and approval history | YELLOW |
| P03 | Financial inclusion / anti-fraud | Duplicate assistance detection across multiple aid programs | Social protection office | Same household can appear in multiple disconnected programs or be wrongly excluded | CSV matching, periodic audits | Cross-agency coordination is weak, identifiers inconsistent | More digital aid programs mean more overlap risk | Medium: shared proofs, but privacy design is hard | YELLOW |
| P04 | Supply chain transparency | Compliance passport for SME exporters facing sustainability and product-document requests | SME exporter or producer | Repeatedly proving origin, material, and compliance to buyers is slow and inconsistent | PDFs, emails, shared drives, broker mediation | Document authenticity and revocation are hard across orgs | Digital Product Passport and compliance pressure are increasing | Strong: certificate hash + revocation + event proof | GREEN |
| P05 | Supply chain transparency | Cold-chain handoff proof for vaccines and essential medicines | Distributor / clinic buyer | Hard to trust temperature and custody claims across transport handoffs | Excel logs, paper signatures, proprietary dashboards | Small actors lack shared verifiable records across companies | Supply resilience and audit expectations remain high | Medium: chain-of-custody proof helps, but sensor trust is separate | YELLOW |
| P06 | Sustainability | Proof of recycled material recovery behind brand ESG claims | Brand sustainability team | Hard to prove that reported recovery or recycling actually happened | Audits, supplier declarations, annual reporting | Evidence is scattered and easy to over-claim | Anti-greenwashing pressure is rising | Strong: traceability + certificate proof | YELLOW |
| P07 | Climate / environmental monitoring | MRV audit trail for small carbon or renewable projects | Project developer / verifier | Monitoring data, reports, and verification history are hard to audit end-to-end | CSVs, PDFs, point solutions | Logs can be changed, provenance is unclear, verification is laborious | Climate reporting pressure and digital MRV are rising | Medium-strong: tamper-evident logs and audit checkpoints | GREEN |
| P08 | Financial inclusion / climate resilience | Claim evidence package for smallholder climate insurance | Smallholder-serving insurer | Payout decisions are delayed because proof of loss is inconsistent | Field agent forms, photos, manual review | Evidence is fragmented and easy to dispute | Climate risk is increasing and smallholders remain underserved | Medium: shared proof trail is useful, but claims logic is complex | YELLOW |
| P09 | Digital credentials | Portable skills and safety credentials for informal or migrant workers | Worker and employer | Workers cannot easily prove training, causing repeated checks and exclusion | Paper certificates, WhatsApp scans, platform-specific records | Documents are easy to fake and hard to verify | Labor mobility and cross-employer verification are common pain points | Medium-strong: credential verification and revocation | YELLOW |
| P10 | Financial inclusion | Verifiable farm activity records for smallholder access to finance | Smallholder and agri lender | Farmers lack trusted operational history to unlock better credit or input financing | Cooperative attestations, agent reports, SMS records | Data is incomplete, local, and hard for lenders to trust | Agri finance remains under-served | Medium: attestations help, but origin of truth remains hard | YELLOW |
| P11 | Public digital infrastructure | Public procurement delivery proof for school meals or aid supplies | Local government or NGO procurement manager | Hard to verify that contracted deliveries actually arrived as claimed | GRNs, signatures, photos, Excel | Multi-actor reconciliation is manual and fraud-prone | Procurement integrity is a visible public problem | Strong: milestone attestation + audit proof | GREEN |
| P12 | Public digital infrastructure | Contractor milestone verification before payment release | Local government / donor-funded program manager | Hard to release payments confidently when proof of completion is disputed | PDFs, email approvals, site photos | Approval history is fragmented and backdated evidence is possible | More donor oversight and public spending scrutiny | Strong: milestone attestations and non-repudiation | YELLOW |
| P13 | Anti-fraud / consumer protection | Verified QR payment receiver registry for utility and business impersonation scams | Consumer protection or issuer partner | Users cannot tell if a QR code or payee is genuine | Static merchant lists, warnings, customer support | Real-time verification and revocation are weak | QR scams and impersonation losses are rising | Medium: signed payee registry and revocation log | YELLOW |
| P14 | Anti-fraud / consumer protection | Revocation registry for fake seller or fake credential complaints across institutions | Consumer protection network | Scam signals and takedown data are siloed | Platform-local reports, law enforcement referrals | No shared trust layer across organizations | Fraud losses remain large | Medium: useful shared signals, but governance is hard for a hackathon | YELLOW |
| P15 | Circular economy | Repair and refurbishment passport for used electronics | Refurbisher / buyer | Buyers cannot trust repair history and parts provenance | Invoice folders, platform listing claims | No portable, verifiable lifecycle record | Right-to-repair and resale markets are growing | Medium: lifecycle record is plausible | YELLOW |
| P16 | Digital credentials | NFT attendance or university certificate showcase | Student | Wants a modern way to display certificates | LinkedIn, PDFs, school portals | Pain is weak relative to more urgent public-interest problems | No urgent institutional driver here | Weak: blockchain mostly decorative | RED |
| P17 | Donation transparency | Donor dashboard showing where money went | Charity donor | Wants transparency after giving | Reports, dashboards, annual statements | Common hackathon trope; not a sharp operational failure | BGA explicitly warns against generic versions of this | Weak unless a very new angle exists | RED |
| P18 | Financial inclusion | Cross-chain remittance fee optimizer with wallet flow | Migrant sender | Wants cheaper transfers | Wallets, exchanges, remittance apps | UX and regulation dominate the real problem | Strong regulatory and crypto UX friction for non-crypto users | Weak for this track | RED |
| P19 | Sustainability | Recycling reward token for consumers | Consumer | Wants incentives to recycle | Coupons, loyalty points | Pain is weak and behavior change is indirect | Too far from BGA's likely institutional trust focus | Weak | RED |
| P20 | Governance | On-chain campus voting | Student government | Wants transparent voting | Google Forms, election tools | Problem is not high-stakes enough for this track | Weak institutional pain and low social impact | Weak | RED |

## Survivors After First Filtering

`GREEN` or `YELLOW` survivors: 15  
Serious near-term candidates to carry forward:

- P01
- P02
- P03
- P04
- P05
- P06
- P07
- P08
- P09
- P10
- P11
- P12
- P13
- P14
- P15

## Early Rejections

- P16: weak pain and likely decorative blockchain
- P17: generic anti-pattern for this sponsor
- P18: too regulated and too wallet-dependent
- P19: impact too indirect
- P20: low-stakes problem for this track

## Evidence Labels Used In This Phase

- `WB-DPI`: https://www.worldbank.org/en/results/2023/10/12/creating-digital-public-infrastructure-for-empowerment-inclusion-and-resilience
- `WB-FINDEX`: https://openknowledge.worldbank.org/entities/publication/099620109212322848
- `WB-ID4D`: https://blogs.worldbank.org/en/digital-development/850-million-people-globally-dont-have-id-why-matters-and-what-we-can-do-about
- `W3C-VC`: https://www.w3.org/TR/vc-data-model/
- `GS1-EPCIS`: https://ref.gs1.org/standards/epcis/2.0.1/
- `EU-DPP`: https://commission.europa.eu/energy-climate-change-environment/standards-tools-and-labels/products-labelling-rules-and-requirements/sustainable-products/ecodesign-sustainable-products-regulation_en
- `FTC-2024`: https://www.ftc.gov/node/87602
- `FTC-QR`: https://consumer.ftc.gov/consumer-alerts/2023/12/scammers-hide-harmful-links-qr-codes-steal-your-information
- `UNFCCC-MRV`: https://unfccc.int/reporting-and-review
- `MOEJ-MRV`: https://www.env.go.jp/press/press_03380.html
- `RAHAT`: https://rumsan.com/portfolio/rahat
- `PLASTIKS`: https://www.plastiks.io/our-technology
