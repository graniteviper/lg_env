---
name: Antigravity Flutter Code Reviewer
description: >
  The final gatekeeper for quality.
  Ensures SOLID/Agile compliance, 80%+ test coverage, 
  and manages the transition from skeleton to production code.
---

# The Flutter OSS Code Reviewer 🧐

## Overview
This is the fifth step in the mandatory pipeline:
Init → Brainstorm → Plan → Execute → Review → Quiz (Finale)

The goal is to simulate a professional Open Source Flutter code review. 
The code must not only work — it must be **excellent, tested, and decoupled**.

---

## 🔍 The Review Process

### 1. SOLID & Architectural Purity (Mandatory)
Review the implementation against the **SOLID** rubric. You MUST NOT approve code that fails these checks:

- **Single Responsibility (S):** Do widgets contain business logic? (If yes, move to a Controller/Service).
- **Open/Closed (O):** Can we add new LG commands without modifying existing core logic?
- **Interface Segregation (I):** Are we forcing classes to depend on `lg_service.dart` methods they don't use?
- **Dependency Inversion (D):** Are we using Dependency Injection (e.g., Provider/GetIt) or hardcoding instances?

### 2. Agile Iteration & Cleanliness
- **Reusable Functions:** Verify that logic is broken down into small, reusable functions. No "God Functions" (>40 lines).
- **DRY Compliance:** Is the new feature duplicating logic found in the starter kit?

### 3. Mandatory Testing Gate (100% Non-Negotiable)
The agent is forbidden from approving a review without a verified test suite.

- **Static Analysis:** `flutter analyze` must return **ZERO** issues.
- **Unit & Widget Tests:** Run `flutter test`. 
- **Coverage Requirement:** Run `flutter test --coverage`. New logic **MUST** reach **≥ 80% coverage**.
- **Regresson Check:** Ensure the basic `lg-controller` functionality (rig connection) is still intact.

### 5. Android Security Audit (Mandatory)
- **Secret Detection:** Scan code for hardcoded strings that look like IPs, Passwords, or API Keys.
- **Storage Check:** Verify `flutter_secure_storage` is used for all user-provided rig parameters.
- **Permissions Audit:** Ensure `AndroidManifest.xml` only requests the minimum necessary permissions (e.g., `INTERNET`). No unnecessary access to `READ_EXTERNAL_STORAGE`.
- **ProGuard Check:** Verify `build.gradle` has `minifyEnabled true`.



---

## 🧹 The Skeleton Pruning Protocol (Feature 3)
The agent must now determine if the "Starter Kit" code is still necessary.

**Evaluation Criteria:**
1. Has the new feature completely replaced a piece of skeleton logic?
2. Does the agent "understand" the implementation well enough to maintain it without the original reference?

**Action:**
If the user is happy with the build, the Reviewer must recommend a **Pruning Step**:
- "I have detected that `skeleton_helper.dart` is no longer needed. Should I remove it now?"
- **Constraint:** The agent must only delete code that has 0 active references in the new implementation.

---

## 📝 The Review Report
Write the review results to: `docs/reviews/YYYY-MM-DD-<feature>-review.md`

### Required Template
```markdown
# Code Review: [Feature Name]

## 🟢 The Good
- [List strengths in SOLID compliance]

## 🛠 Tooling & Quality Status
- **Analyze**: PASS / FAIL
- **Tests**: PASS / FAIL (Results attached)
- **Coverage**: X% (Target: 80%)

## 🟡 Required Refactors (Gated)
- [Identify specific SOLID violations]
- [Identify missing Unit Tests]

  Also make sure to follow the security measures in the lg-security/skills.md file.

## 🧹 Skeleton Cleanup Status
- [ ] Recommended: Remove `path/to/skeleton_file` (Reason: Fully replaced by X)

## Final Verdict: APPROVED / REVISIONS NEEDED