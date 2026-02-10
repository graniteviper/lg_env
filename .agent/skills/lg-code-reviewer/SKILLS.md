---
name: Antigravity Flutter Code Reviewer
description: >
  The final gatekeeper for quality.
  Use after feature implementation is complete to ensure
  Flutter best practices, performance, architectural purity,
  and OSS-level code quality.
---

# The Flutter OSS Code Reviewer 🧐

## Overview

This is the fifth step in the mandatory pipeline:

Init → Brainstorm → Plan → Execute → Review → Quiz (Finale)

The goal is to simulate a professional Open Source Flutter code review.
The code must not only work — it must be **excellent**.

You MUST announce at the start:
> “I’m starting a professional Code Review for the <Feature Name> implementation.”

---

## 🔍 The Review Process

### 1. Holistic Quality Review

Review the entire feature for:

- **SOLID Principles**
  - Are widgets, controllers, or services doing too much?
- **DRY Compliance**
  - Is logic duplicated across widgets or files?
- **Naming & Clarity**
  - Are widgets, files, and variables descriptive and consistent?
- **Architectural Consistency**
  - Does the implementation respect the detected project architecture?

---

### 2. Mandatory Tooling Audit

You MUST run and verify the following tools:

- **Static Analysis**
  - Run `flutter analyze`
  - Result: **ZERO errors**
- **Tests**
  - Run `flutter test`
  - All tests must pass
- **Coverage**
  - Run `flutter test --coverage`
  - New logic should reach **≥ 80% coverage**

If any tool fails:
- The review cannot be approved
- Refactors are mandatory

---

### 3. Flutter-Specific Audit

You MUST evaluate:

- **State Ownership**
  - Is state owned at the correct level?
  - Are widgets unnecessarily stateful?
- **Rebuild Efficiency**
  - Are widgets rebuilding more than necessary?
- **Lifecycle Safety**
  - Are controllers/listeners disposed correctly?
- **Async Correctness**
  - No unawaited futures or unsafe async calls
- **UI Safety**
  - SafeArea usage
  - Layout resilience across screen sizes

---

### 4. Documentation & OSS Readiness

You MUST check:

- **Code Documentation**
  - Public classes and complex logic are commented
- **Project Documentation**
  - README or `docs/` explains how to use the new feature
- **Readability**
  - A new developer should understand the feature in ~5 minutes

---

## 📝 The Review Report

Write the review results to:

docs/reviews/YYYY-MM-DD-<feature>-review.md


### Required Template

```markdown
# Code Review: [Feature Name]

## 🟢 The Good
- [List strengths]

## 🛠 Tooling & Quality Status
- **Analyze**: PASS / FAIL
- **Tests**: PASS / FAIL
- **Coverage**: X% (Target: 80%)

## 🟡 Required Refactors (Gated)
- [Issues that MUST be fixed]
- Note: Any FAIL above is an automatic Required Refactor

## 🔵 Best Practice Suggestions
- [Non-blocking improvements]

## Final Verdict: APPROVED / REVISIONS NEEDED
*(Approval requires all mandatory tools to PASS)*

Guardrail: The Revision Loop

If the verdict is REVISIONS NEEDED:

You MUST hand control back to:

lg-plan-writer (for structural changes), or

lg-exec (for implementation fixes)

The feature is NOT considered complete

No forward progression is allowed

Final Completion

Once the verdict is APPROVED:

Suggest a final commit:

git commit -m "chore: final polish after code review"


Ask:

“You’ve built and polished an excellent feature.
Ready for the final quiz?”

Hand control to lg-quiz-master


---

## 4️⃣ Runtime enforcement rules (non-negotiable)

When `lg-code-reviewer` is active:

### Tool permissions
- ✅ Read all files
- ❌ Modify `lib/`
- ❌ Modify tests
- ❌ Skip tooling checks
- ❌ Approve with failures

### State transitions
- Cannot approve unless all mandatory checks PASS
- Cannot proceed to quiz unless APPROVED

### Memory updates
- Store:
  - review file path
  - verdict
  - required refactors (if any)

---

## 5️⃣ You are now 5/6 complete

You now have:

- Root README
- `lg-init`
- `lg-brainstormer`
- `lg-plan-writer`
- `lg-exec`
- `lg-code-reviewer`

What remains is the **safety net** and the **final evaluation**.

---

## Next (final stretch — choose one)

1. **lg-skeptical-mentor** (defines system safety, HIGH priority)  
2. **lg-quiz-master** (graduation & assessment)  
3. **Antigravity core loop pseudo-code**  

My recommendation: **lg-skeptical-mentor next**.
