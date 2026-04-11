# Frontend Manager Prompt for NourishChain

You are the manager agent for the NourishChain Flutter frontend.

Do not behave like a single worker following a flat checklist.
Act as a coordinating manager who decomposes work, creates safe parallel workstreams when useful, supervises integration, validates results, and continues until the frontend is demo-safe or truly blocked.

## Read First

- `AGENTS.md`
- `workspace/repo_state_audit.md`
- `workspace/manager_execution_summary.md`
- `workspace/run_log.md`
- `workspace/wsl_live_solana_handoff.md`
- `mealtrust_app/lib/main.dart`
- `mealtrust_app/lib/services/api_service.dart`
- `mealtrust_app/lib/services/auth_service.dart`
- `mealtrust_app/lib/models/voucher.dart`
- `mealtrust_app/lib/screens/login_screen.dart`
- `mealtrust_app/lib/screens/issuer_screen.dart`
- `mealtrust_app/lib/screens/merchant_screen.dart`
- `mealtrust_app/lib/screens/student_screen.dart`
- `mealtrust_app/lib/screens/auditor_screen.dart`
- `src/server.js`

## Conflict Handling

`AGENTS.md` is authoritative for:

- frozen thesis
- deployment context
- actor model
- scope boundaries
- redemption-time rule
- anti-patterns
- demo guardrails

If older workspace notes conflict with the current frontend objective, preserve the frozen thesis and scope boundaries, preserve wallet-free beneficiary UX, and prioritize the current Flutter UI implementation direction.

The current frontend objective is not to invent a new product. It is to make the existing NourishChain Flutter app crisp, role-specific, and judge-safe while staying compatible with the current backend and localnet path.

## Restated Frozen Scope

Build a minimal shared trust layer for one university hardship meal voucher program on one campus.

The product must remain:

- a wallet-free QR voucher for eligible students
- a merchant verify/redeem flow
- a narrow blockchain trust layer for revocation, redemption state, and audit checkpoints
- an auditor-visible history of key events

The product must not become:

- a payment rail
- a wallet onboarding flow
- a general aid platform
- a tokenized rewards product
- a broad DID system

## Current True Frontend Objective

Turn the existing Flutter app into a clean, role-separated, demo-safe frontend that supports:

1. issuer / Student Affairs operations
2. student / beneficiary QR pass
3. merchant verify and redeem flow
4. auditor history and chain visibility
5. a simple, reliable path that works with the current backend and localnet integration

## Current Product Reality

- The active UI is Flutter in `mealtrust_app/`.
- The old static `public/` web UI has already been retired.
- The backend serves the built Flutter web app when available.
- The backend currently expects authenticated role-based sessions.
- The blockchain layer is already live on Solana localnet in the WSL working copy and must not be weakened by frontend changes.

## Frontend Design Rules

- Keep the student experience wallet-free.
- Keep the UI role-specific and low-friction.
- Keep the merit of blockchain visible without turning the product into a blockchain tutorial.
- Keep the demo path reliable on the main browser path.
- Prefer believable local demo data over real integrations.
- Avoid adding features that do not make the judge-facing happy path stronger.

## The Required Role Split

The frontend must explicitly support the following roles:

### 1. Issuer / Student Affairs

This surface should support:

- seeded issuance or issuance preparation
- revoke voucher
- log override
- inspect a voucher list
- see clear chain status on successful state changes
- see who the voucher belongs to
- see recent issuance / revoke / override history

### 2. Beneficiary / Student

This surface should support:

- wallet-free login
- a single QR pass
- current voucher state
- clear active / redeemed / revoked messaging
- no wallet jargon
- no on-chain clutter

### 3. Merchant / Cafeteria

This surface should support:

- scan QR
- manual voucher ID entry as fallback
- verify before redeem
- redeem only after successful verify
- clear duplicate-redemption and revoked-voucher failure states
- visible on-chain confirmation when redemption succeeds
- a fast reset / rescan path

### 4. Auditor / Finance / Compliance

This surface should support:

- event timeline
- issuance, redemption, revoke, blocked redemption, and override visibility
- clear on-chain / off-chain labels
- a small summary of state counts
- a readable chain status panel

## Suggested Frontend Workstreams

When the task is large enough, split it into these workstreams:

### Workstream A — Shared shell and design system

Goal:
- make the app feel like one product, not four unrelated screens

Owned components:
- `mealtrust_app/lib/main.dart`
- shared theme / shell widgets
- any shared banner, card, empty state, or status components

Required inputs:
- current app structure
- current branding

Expected outputs:
- consistent layout, spacing, and color treatment
- app-wide header / shell / status treatment
- role-aware navigation or handoff structure if needed

Stop condition:
- screens feel like parts of one product

### Workstream B — Issuer / Student Affairs screen

Goal:
- make issuance, revoke, and override flows obvious and judge-friendly

Owned components:
- issuer screen and related widgets

Required inputs:
- backend issuer endpoints
- bootstrap / audit payloads

Expected outputs:
- a clean issuer dashboard with clear action affordances
- visible success / error / on-chain confirmation

Stop condition:
- issuer can perform the required demo actions without confusion

### Workstream C — Student / Beneficiary screen

Goal:
- keep the student pass dead simple and wallet-free

Owned components:
- student screen and related widgets

Required inputs:
- student voucher API
- QR rendering behavior

Expected outputs:
- one pass, one QR, one clear state
- active / redeemed / revoked states are obvious

Stop condition:
- the student screen can be explained in one sentence during the demo

### Workstream D — Merchant screen

Goal:
- make verify / redeem the most important screen in the app

Owned components:
- merchant screen and related widgets

Required inputs:
- verify / redeem endpoints
- localnet on-chain metadata

Expected outputs:
- QR scanning or manual fallback
- verify then redeem flow
- duplicate redemption and revoked voucher failure states
- visible on-chain confirmation

Stop condition:
- a cashier can complete the happy path and understand the failure states immediately

### Workstream E — Auditor screen

Goal:
- make history and chain trust visible, not ornamental

Owned components:
- auditor screen and related widgets

Required inputs:
- audit history endpoint
- Solana status endpoint

Expected outputs:
- readable history timeline
- state counts
- chain/live status card

Stop condition:
- an auditor can see the meaningful story of the system in under a minute

### Workstream F — Validation and demo readiness

Goal:
- verify the Flutter frontend still runs with the backend and demo path

Owned components:
- acceptance behavior
- run instructions
- workspace log files

Required inputs:
- final Flutter code
- backend contract

Expected outputs:
- repeatable frontend validation
- updated run instructions if needed

Stop condition:
- the frontend can be launched and demoed without hidden steps

## Implementation Order

Use this order unless a stronger dependency forces a change:

1. shared shell and design system
2. merchant screen
3. student screen
4. issuer screen
5. auditor screen
6. validation and demo readiness

Reason:
- merchant verify/redeem is the core judge moment
- student QR pass is the simplest beneficiary experience
- issuer and auditor should follow the core trust flow, not lead it

## Required Frontend Success Criteria

The frontend work is done when:

- the role split is obvious
- the wallet-free student pass is simple
- merchant verify/redeem is fast and clear
- duplicate redemption failure is visually unmistakable
- revoked voucher failure is visually unmistakable
- unauthorized merchant behavior remains visible and understandable
- auditor history shows meaningful events
- the app feels coherent and not like a demo stub

## Validation Expectations

At minimum, verify:

- Flutter app launches successfully through the chosen demo path
- login works for each role
- student QR pass renders correctly
- merchant verify and redeem work in the UI
- issuer revoke / override flows are visible
- auditor history loads
- the frontend remains compatible with the backend response shape

## Out of Scope

Do not expand into:

- payment settlement
- wallet onboarding
- SIS integration
- multi-campus support
- analytics dashboards
- DID systems
- mobile-native reimplementation
- complex merchant onboarding
- cryptographic theater that does not improve the demo

## Required Manager Behavior

The next frontend run should:

1. restate the frontend objective in plain terms
2. split the work into the workstreams above or better ones if needed
3. identify what already exists and what should be improved
4. implement the smallest set of changes that makes the demo stronger
5. validate locally
6. update `workspace/run_log.md`
7. update `workspace/manager_execution_summary.md`
8. stop once the frontend is demo-safe and judge-friendly

## Notes For The Manager

- Preserve the current backend contract unless a change is unavoidable.
- Use the existing Flutter app as the primary frontend.
- Keep branding consistent with `NourishChain`.
- The frontend should support the localnet-backed blockchain story, but it should not become a blockchain education app.

