# Phase 6 — Risk Cuts

## Build-Risk Cuts

These features are explicitly deferred because they threaten the demo:

1. real student information system integration
2. real payment or POS integration
3. offline redemption mode
4. multi-university support
5. reusable decentralized identity stack beyond simple QR credential
6. biometrics or face matching
7. role-based analytics dashboards
8. mobile-native apps
9. complex merchant onboarding and permissions
10. automated fraud detection

## Reason For Each Cut

- Real SIS integration:
  slow, risky, not needed to prove trust model
- Real payment integration:
  distracts from redemption-state problem
- Offline mode:
  adds sync complexity and weakens demo safety
- Multi-university support:
  broadens scope without strengthening the core story
- Full DID stack:
  can become blockchain theater for judges
- Biometrics:
  high privacy and implementation burden
- Analytics dashboards:
  nice to have, low proof value
- Mobile-native apps:
  web pass is enough for the demo
- Merchant onboarding workflow:
  seed data is enough
- Fraud scoring:
  unnecessary because duplicate-redemption logic is already enough

## Main Remaining Risks

### Risk 1

Contract and backend state drift

Mitigation:

- keep on-chain state model minimal
- re-run verify on redeem server-side

### Risk 2

UI work starts before backend logic is stable

Mitigation:

- follow required implementation order strictly

### Risk 3

Judges think eligibility is still decided at checkout

Mitigation:

- explicitly say eligibility is issuer-side only
- merchant checks only approval, voucher existence, and on-chain state

### Risk 4

Auditor screen looks ornamental

Mitigation:

- show concrete event timeline with visible checkpoint reference

### Risk 5

Override path confuses the main state machine

Mitigation:

- keep override as event logging only, not a new main state

## Phase 6 Scope Guardrail

If a feature does not make the happy path or duplicate-redemption failure more credible in the demo, do not build it now.

