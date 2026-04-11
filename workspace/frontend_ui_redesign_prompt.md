# NourishChain Frontend Redesign Prompt

You are the manager agent for the NourishChain Flutter frontend redesign.

Treat the current screens as disposable prototypes. Rebuild the user-facing UI so it clearly separates the issuer, student, merchant, and auditor experiences.

## Read First

- `AGENTS.md`
- `workspace/repo_state_audit.md`
- `workspace/manager_execution_summary.md`
- `workspace/run_log.md`
- `workspace/frontend_manager_prompt.md`
- `workspace/wsl_live_solana_handoff.md`
- `mealtrust_app/lib/main.dart`
- `mealtrust_app/lib/models/voucher.dart`
- `mealtrust_app/lib/services/api_service.dart`
- `mealtrust_app/lib/services/auth_service.dart`
- `mealtrust_app/lib/widgets/nourish_components.dart`
- `mealtrust_app/lib/screens/home_screen.dart`
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

If older workspace notes or stale front-end assumptions conflict with the current objective, preserve the frozen thesis and scope boundaries, preserve wallet-free beneficiary UX, and prioritize the current Flutter implementation direction.

## Current Objective

Build a judge-safe NourishChain frontend that is clearly segmented by role and tells the trust story without blockchain jargon overload.

The interface must support the live local demo path and keep the backend contract stable.

## Product Thesis to Preserve

NourishChain is a minimal shared trust layer for one university hardship meal voucher program on one campus.

The product is:

- a wallet-free QR voucher for eligible students
- a merchant verify/redeem flow
- a narrow blockchain trust layer for revocation, redemption state, and audit checkpoints
- an auditor-visible history of key events

The product is not:

- a general aid platform
- a donation platform
- a crypto onboarding product
- a tokenized rewards system
- a national identity system
- a payment rail

## Frontend Strategy

Rebuild the app as a cohesive, role-separated web-first Flutter experience.

Do not preserve the old screen structure just because it exists.
Do not keep any screen that does not strengthen the demo story.
Do not add a library unless it clearly improves speed, clarity, or accessibility.

Use the existing brand language:

- `NourishChain`
- the transparent logo from `mealtrust_app/assets/brand/nourish_chain_logo.png`
- the current color family, but make the role differentiation stronger

## Visual Direction

The app should feel like a carefully designed institutional product, not a generic CRUD dashboard.

Use:

- a premium light theme with warm neutral surfaces
- strong role-specific color accents
- a clear left-to-right information hierarchy
- large readable state cards
- visible trust / status / checkpoint cues

Avoid:

- repetitive generic cards
- same-size dashboard tiles everywhere
- low-effort icon soup
- blockchain-themed decoration
- generic enterprise templates that make every screen look the same

## Required Screen System

The redesign must explicitly support the following flows:

### 1. Home / Role Switch Surface

Purpose:
- explain the product in one glance
- give the operator a fast way to jump between roles
- show the current demo state and login status clearly

Must include:
- the NourishChain logo and name
- one short product statement
- role cards or segmented navigation
- a visible demo-state / localnet indicator
- a clear way to enter issuer, student, merchant, and auditor flows

### 2. Issuer / Student Affairs Surface

Purpose:
- issuance, revoke, and manual override
- see who the voucher belongs to
- see chain confirmation for state changes

Must include:
- seeded issuance or issuance preparation
- a voucher list
- voucher detail state
- revoke action
- override logging action
- on-chain confirmation panel
- recent issuer events

The issuer view should feel operational and authoritative, not like an admin toy.

### 3. Student / Beneficiary Surface

Purpose:
- wallet-free QR pass
- one clear voucher state
- no blockchain jargon

Must include:
- large QR pass or QR placeholder when unavailable
- clear active / redeemed / revoked state
- one voucher summary
- one simple explanation of what the student should do next

The student screen should be the simplest screen in the app.

### 4. Merchant Surface

Purpose:
- scan
- verify
- redeem
- show failure states fast

Must include:
- a scanner area or obvious scan entry area
- manual voucher ID fallback
- verify before redeem
- redeem action
- duplicate-redemption failure state
- revoked-voucher failure state
- unauthorized merchant failure state
- a visible success confirmation with on-chain details

The merchant screen should be the most important operational screen in the app.

### 5. Auditor Surface

Purpose:
- inspect the shared trust story
- see meaningful history, not decoration

Must include:
- event timeline
- filters for issued / redeemed / revoked / blocked / override
- chain status summary
- on-chain / off-chain labels
- a small count summary
- readable history entries with timestamps and actor context

The auditor screen should make the trust model obvious in under a minute.

## Screen Transitions

Design explicit navigation and transitions:

- login or role switch leads into the selected role surface
- merchant verify can transition into redeem success or blocked failure
- issuer revoke and override should update the history visibly
- student screen should always be one step away from the QR pass view
- auditor should be reachable from the role shell without needing to re-login

If the current app needs a new shell or navigation structure, add it.
Do not force the roles into one generic dashboard.

## Required Functional States

The UI must clearly represent:

- active voucher
- redeemed voucher
- revoked voucher
- duplicate redemption blocked
- merchant not approved
- manual override logged
- live localnet / demo chain status

## Use Case Scenarios

The UI should support these realistic demo scenarios:

1. Student logs in and shows a wallet-free QR pass.
2. Merchant scans or types the voucher ID, verifies it, and redeems it.
3. Merchant tries the same voucher again and sees duplicate-redemption blocking.
4. Issuer revokes a voucher and that state becomes visible immediately.
5. Auditor opens the history and sees the same event trail that the issuer and merchant changed.

## Implementation Expectations

When implementing:

- keep the backend API contract stable
- update Flutter screens and shared widgets together
- prefer reusable role-specific widgets over one-off screen hacks
- keep the layout responsive for web and tablet widths
- ensure the app still works with the current local demo path

If a library is needed, prefer Flutter-native packages only.
Do not try to apply React-specific UI library suggestions directly from external articles.

## Suggested Workstreams

When the task is large, split into these workstreams:

### Workstream A — App shell and navigation

Goal:
- make role switching and screen entry obvious

Owned:
- `mealtrust_app/lib/main.dart`
- `mealtrust_app/lib/screens/home_screen.dart`
- shared shell widgets

Stop:
- the app has a coherent navigation shell

### Workstream B — Issuer surface

Goal:
- issuance / revoke / override / history

Owned:
- issuer screen and issuer-specific widgets

Stop:
- issuer operations are clearly visible and demo-safe

### Workstream C — Student surface

Goal:
- wallet-free QR pass

Owned:
- student screen and student-specific widgets

Stop:
- student flow is unmistakable and minimal

### Workstream D — Merchant surface

Goal:
- scan / verify / redeem / failure states

Owned:
- merchant screen and merchant-specific widgets

Stop:
- the happy path and the blocked states are obvious

### Workstream E — Auditor surface

Goal:
- history and chain visibility

Owned:
- auditor screen and history widgets

Stop:
- auditor can understand the system state quickly

### Workstream F — Shared design system

Goal:
- make the whole app feel like one product

Owned:
- shared theme
- shared cards
- shared status components
- logo / brand mark

Stop:
- screens share a consistent visual grammar

### Workstream G — Validation

Goal:
- confirm the redesign is still runnable

Owned:
- `flutter analyze`
- `flutter build web`
- local backend smoke checks

Stop:
- the redesigned app runs successfully in the local demo path

## Hard Constraints

- Do not reintroduce the deleted legacy `public/` UI.
- Do not add wallet onboarding.
- Do not add payment settlement.
- Do not add new blockchain scopes.
- Do not add features that do not strengthen the demo.
- Do not make the app more complex than needed for the 90-120 second demo.

## Definition of Success

The redesign is successful when:

- the app clearly separates issuer, student, merchant, and auditor experiences
- the navigation / screen transitions are obvious
- the logo and brand feel intentional, not pasted on
- the QR / verify / redeem / duplicate-block story is easy to understand
- the auditor screen makes the shared trust layer legible
- the app still builds and runs in the local demo path

## Output Expectations

When executing this prompt, produce:

- code changes in the Flutter frontend
- updated `workspace/run_log.md`
- updated `workspace/manager_execution_summary.md`
- a short validation summary
- if needed, a concise note on any backend contract mismatch

