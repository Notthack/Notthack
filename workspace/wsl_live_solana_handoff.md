# WSL Live Solana Handoff

## Current State

The Solana localnet integration is functionally working in the WSL-side working copy.

Confirmed in WSL:

- `anchor build` succeeds
- `solana-test-validator --reset --ledger ... --rpc-port 8899` starts cleanly
- `anchor deploy --provider.cluster localnet` succeeds
- deployed program ID:
  - `AWyYvJCuYwn2FQvQj4P3nz3vmTgn8HgJBY6itReuy1pu`
- `solana program show <PROGRAM_ID> --url http://127.0.0.1:8899` succeeds
- backend redeem flow now returns real localnet transaction metadata
- redeem transaction signature was confirmed with `solana confirm -v`
- at least one real redeem write is proven on localnet

Example confirmed redeem signature:

- `5D2RVyUfvEpHemkrCZtF7LBvhwTYsPgr69GJ4kAbwXJtu8FvfvdGB2KXpzRvHUFA726dRt8v2BteQEQ1Knmk2yjE`

## What Is Still Needed

The GitHub repo still needs the WSL-side live Solana work pushed back into the canonical remote branch.

The current main repo already contains:

- Flutter web UI integration
- auth and demo surface updates
- branding rename to `NourishChain`
- the earlier scaffold for `anchor/` and `src/lib/solana-ledger.js`

But the live localnet transaction wiring exists in the WSL working copy and must be synced separately.

## Frozen Product Boundaries

Do not widen scope while syncing this work.

- one-campus university hardship meal voucher program
- wallet-free student QR flow
- blockchain only for redemption state, revocation state, audit checkpoints, override event logging
- no payments
- no student wallets
- no full SIS integration
- no DID stack
- no analytics dashboard

## Recommended Git Strategy

1. Inspect the WSL working copy diff.
2. Commit the live Solana changes on a dedicated feature branch.
3. Push the feature branch to GitHub.
4. Open a PR against `main`.
5. Review the PR using the code-review mindset.
6. Merge only after verifying the live localnet path still works.

## What Reviewers Need To Confirm

- backend returns real `onChain.signature` for successful redeem/revoke/override writes
- `solana-ledger.js` no longer behaves as a stub for the live path
- on-chain write succeeds before local voucher state is committed
- duplicate redemption still blocks
- revoked voucher still blocks
- unauthorized merchant still blocks
- Flutter web build still works through the backend-serving path

## Exact Demo Path

Use the current demo path in the main repo:

1. `cd mealtrust_app`
2. `flutter build web`
3. `cd ..`
4. `npm start`
5. open `http://localhost:3000`

This should remain the default demo path even after the live Solana branch lands.

## Remaining Risks

- WSL and Windows worktrees may diverge if the live Solana changes are edited in only one environment.
- The live Solana path must preserve the existing JSON response contract expected by the Flutter UI.
- If the PR includes rename noise or unrelated refactors, it should be trimmed before merge.

## Current Recommendation

Treat the WSL live-Solana work as the next required GitHub sync item.
The minimal goal is to land:

- live localnet redeem/revoke/override writes
- signature metadata in backend responses
- no regression in acceptance behavior

Only after that should any further refactor or cleanup be considered.
