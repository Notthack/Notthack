# Phase 5 — On-Chain / Off-Chain Split

## Design Rule

Store the minimum shared trust state on-chain.  
Keep all personally identifying and operationally sensitive data off-chain.

## Data Split Table

| Data item | On-chain or off-chain | Why |
| --- | --- | --- |
| Voucher credential ID hash | On-chain | Shared reference without exposing student identity |
| Voucher status: active / revoked | On-chain | Merchants and auditors need a neutral shared status |
| Redemption status / redeemed event hash | On-chain | Prevent duplicate redemption across terminals and preserve auditability |
| Redemption timestamp checkpoint | On-chain | Tamper-evident audit trail |
| Manual override event hash | On-chain | Exceptions must also be auditable |
| Student name | Off-chain | Personal data; merchant does not need it on-chain |
| Student ID number | Off-chain | Personal data |
| Hardship assessment details | Off-chain | Sensitive eligibility basis |
| Voucher program rules | Off-chain | Operational logic can change and does not need immutability |
| Merchant roster and terminal metadata | Off-chain | Operational data; can be signed and managed centrally |
| Full redemption receipt details | Off-chain | Financial / operational detail beyond minimum trust state |
| Appeal notes and administrator comments | Off-chain | Sensitive and mutable case-management data |

## What The Chain Is Actually Doing

The chain is only the shared state layer for:

- valid or revoked
- already redeemed or not
- immutable checkpoint history

## What The Chain Is Not Doing

- storing student identity
- calculating hardship eligibility
- handling money movement
- replacing the university database
- replacing merchant POS software

## Privacy Position

The merchant should only learn:

- this voucher is valid or invalid
- this voucher has already been redeemed or not
- optional minimal display text such as meal support type

The merchant should not see the student's hardship rationale or full student profile.

