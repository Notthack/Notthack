# BGA NottsHack Winning Workflow

## Objective
Win the BGA Track at NottsHack by choosing a real problem, validating that it matters, proving that blockchain is actually necessary, and building the smallest demo that scores well on judging.

---

## Non-negotiable judging lens
We will optimize for these questions in this order:

1. Is this a real user problem?
2. Does blockchain solve a trust / coordination / audit problem that a normal database does not solve as well?
3. Can this realistically move toward deployment?
4. Is the impact large and easy to explain?
5. Is the UX acceptable for users who do not understand crypto?
6. Is there a clear path after the hackathon?

---

## Ground rules
- Do not start from chain, token, wallet, or protocol.
- Start from user pain and institutional failure.
- Keep blockchain mostly in the backend.
- Avoid ideas that require normal users to learn wallet setup, bridging, off-ramping, or network switching.
- Avoid generic donation transparency unless there is a very sharp new angle and a much better user flow.
- Kill ideas early if they are clever but not practical.

---

## Master workflow

### Phase 0 — Sponsor reverse engineering
Goal: understand what BGA actually rewards.

Deliverables:
- sponsor summary
- judging summary
- anti-pattern list
- likely winning pattern hypotheses

Exit gate:
- We can explain BGA in 5 sentences.
- We can state what they dislike.
- We can state what “good blockchain use” means for this track.

---

### Phase 1 — Problem bank creation
Goal: generate 15–20 candidate problems inside the allowed domains.

Candidate domains:
- financial inclusion
- supply chain transparency
- digital identity / credentials
- anti-fraud / consumer protection
- public digital infrastructure
- climate / environmental monitoring

For each problem candidate, record:
- target user
- exact pain
- current workaround
- why current system fails
- evidence
- why this matters now
- initial blockchain fit guess

Exit gate:
- At least 10 serious problems remain after first filtering.
- Each problem is framed in human language, not tech language.

---

### Phase 2 — Problem validation
Goal: verify whether the problem is worth solving.

Validation questions:
- Is the user real and easy to describe?
- Is the failure frequent, expensive, risky, or unfair?
- Is there evidence from credible public sources?
- Is the problem narrow enough for a hackathon demo?
- Is the problem already solved well enough by normal software?

Output:
- problem validation table
- evidence log
- “do not pursue” list

Exit gate:
- 3 best problems remain.

---

### Phase 3 — Blockchain necessity test
Goal: reject ideas where blockchain is decorative.

For each shortlisted idea, answer:
- Which actors do not fully trust one another?
- What shared record or proof needs tamper resistance?
- What needs independent verification, revocation, or auditability?
- What stays off-chain?
- What exactly goes on-chain?
- Why not just use a shared server and signatures?

Decision rule:
- If blockchain is not essential to the trust model, reject the idea.

Exit gate:
- 1–2 strong candidates remain.

---

### Phase 4 — Winning concept selection
Goal: pick one concept with the best score.

Scoring dimensions (1–5 each):
- real-world problem clarity
- blockchain necessity
- practicality
- impact potential
- user experience simplicity
- responsible design
- demoability in 48h
- path to pilot / partnership
- distinctiveness

Output:
- final ranked shortlist
- chosen concept
- one-sentence thesis

Thesis template:
> [Target user] cannot reliably [important task] because [system failure].
> We solve this with [product], using blockchain only for [trust / audit / revocation / coordination point].

Exit gate:
- team agrees on one thesis sentence.
- scope freeze begins.

---

### Phase 5 — MVP scope freeze
Goal: define the smallest demo that can still win.

Required MVP definition:
- primary user flow
- supporting actor flow
- proof / audit flow
- one failure case
- one trust moment where blockchain appears
- one metrics slide claim

Cut aggressively:
- no unnecessary token mechanics
- no complicated wallet UX
- no large protocol integration unless absolutely needed
- no extra dashboards unless they support judging

Output:
- MVP checklist
- non-MVP backlog

Exit gate:
- MVP can be demoed in 90–120 seconds.

---

### Phase 6 — Build plan
Goal: turn concept into executable tasks.

Tracks:
- product / UX
- smart contract / ledger logic
- backend / verification service
- frontend demo
- sample data
- pitch / visuals

Daily order:
1. build the happy path
2. build one failure case
3. make data believable
4. connect blockchain proof
5. stabilize demo
6. write pitch

Exit gate:
- happy path works locally
- failure case works
- no dependency is critical and untested

---

### Phase 7 — Judge simulation
Goal: score ourselves like judges.

Judge prompts:
- Why does this need blockchain?
- Who exactly uses this first?
- Why would they switch from current behavior?
- What fails if blockchain is removed?
- What privacy risks remain?
- What part is still fake / simulated?
- Who is the first plausible pilot partner?

Output:
- judge objections list
- revised answers
- pitch weaknesses

Exit gate:
- We can answer hard questions in under 30 seconds each.

---

### Phase 8 — Submission pack
Goal: submit a credible, clear, judge-friendly package.

Submission assets:
- demo video
- slides
- README
- architecture diagram
- problem evidence summary
- blockchain necessity explanation
- future deployment path
- risk / privacy note

Exit gate:
- every deliverable says the same story.
- no contradiction between demo, README, and slides.

---

## AI roles inside this workflow

### 1. Sponsor Analyst
Reads sponsor pages and extracts incentives, anti-patterns, likely judge behavior.

### 2. Problem Scout
Finds candidate problems inside the allowed domains.

### 3. Problem Validator
Checks whether the problem is truly worth solving.

### 4. Blockchain Critic
Rejects fake blockchain usage.

### 5. Scope Killer
Cuts nice-to-have features and protects MVP.

### 6. Judge Simulator
Acts like a skeptical judge and scores the concept.

### 7. Pitch Editor
Transforms the concept into a sharp deck and speaking flow.

### 8. Risk Reviewer
Checks privacy, usability, fairness, and deployment realism.

---

## Data structure for each shortlisted problem

```yaml
id: P01
title:
target_user:
pain_statement:
current_workflow:
current_failure:
evidence_links:
why_now:
why_blockchain:
what_is_on_chain:
what_stays_off_chain:
pilot_partner_guess:
top_risks:
mvp_demo:
score:
status:
```

---

## Decision gates
Use only these statuses:
- GREEN = proceed
- YELLOW = proceed with caution
- RED = kill

A problem becomes RED if:
- user is vague
- pain is weak
- evidence is thin
- blockchain is decorative
- demo requires too much infrastructure
- UX is hostile to non-crypto users

---

## First execution order
Run these in sequence:

1. sponsor reverse engineering
2. problem bank generation
3. top 10 filtering
4. evidence-backed validation of top 3
5. blockchain necessity test
6. final concept selection
7. MVP scope freeze
8. judge simulation
9. pitch drafting
10. submission pack

---

## What to avoid
- building before choosing the problem
- choosing a problem before validating it
- writing the pitch before the thesis is frozen
- making blockchain the product instead of the mechanism
- assuming judges reward technical complexity on its own
- hiding weak practicality behind “future roadmap”

---

## Current recommendation
Use this workflow as the operating system.
Do not build a fully autonomous black-box agent first.
Build a controlled, auditable process that forces evidence, rejection, and scope control.
That is much more likely to produce a winning project.
