---
name: Antigravity Flutter Plan Writer
description: >
  Use when a feature design or requirements are finalized,
  and before touching Flutter code.
  Creates a detailed, educational implementation plan
  for multi-step Flutter tasks.
---

# Writing Flutter Implementation Plans

## Overview

Write comprehensive, step-by-step implementation plans
that guide users through building features in a Flutter application.

This is the third step in the mandatory pipeline:

Init → Brainstorm → Plan → Execute → Review → Quiz (Finale)

⚠️ PROMINENT GUARDRAIL:
The Skeptical Mentor is your educational partner.
If the user fails the Educational Verification Phase,
you MUST pause and trigger the mentor.

You MUST announce at the start:
> “I’m using the lg-plan-writer skill to create your implementation plan.”

Save all plans to:
docs/plans/YYYY-MM-DD-<feature-name>-plan.md


---

## 🍰 Bite-Sized Task Granularity

Each task MUST:
- Represent a single logical change
- Take approximately 5–10 minutes
- End with verification and a git commit

Plans should encourage:
- Frequent hot reloads
- Small diffs
- Incremental confidence

---

## 📄 Plan Document Header (Mandatory)

Every plan MUST start with the following header:

```markdown
# [Feature Name] Implementation Plan

**Goal:**  
[One sentence describing what this feature builds]

**Architecture:**  
[2–3 sentences explaining the approach, referencing the detected Flutter architecture and state management]

**Tech Stack:**  
[Flutter, Dart, and relevant packages]

**Educational Objectives:**  
[What Flutter or engineering principles the user should learn]

---

## 🗺️ Implementation Checklist
- [ ] Task 1: [Short title]
- [ ] Task 2: [Short title]
- [ ] ...
---

### Task N: [Component / Logic Name]

**Files:**
- Create: `lib/exact/path/to/file.dart`
- Modify: `lib/exact/path/to/existing.dart`
- Test: `test/exact/path/to/test.dart` (if applicable)

**Step 1: Architectural Intent**
Explain WHY these files are being touched.
Reference widget lifecycle, state ownership, or architectural boundaries.

**Step 2: Define Interface or Logic**
Describe the widget, state, or API to be added.

```dart
// Example
class CounterController extends StateNotifier<int> {
  void increment() => state++;
}


Explain how the user knows this works:

Run the app and interact with the UI

Observe widget rebuild behavior

Run flutter analyze

Run flutter test if applicable


git add .
git commit -m "feat: <brief description>"

---

## 🧠 Engineering Principles to Enforce

You MUST reinforce these principles throughout the plan:

- **State Ownership**: State lives where it is owned, not where it is displayed
- **Separation of Concerns**: UI, state, and services remain distinct
- **Flutter Performance**: Avoid unnecessary rebuilds
- **DRY / YAGNI**: Do not introduce abstraction without need
- **Consistency**: Follow the detected project architecture

If the user cannot explain these principles when asked,
trigger the Skeptical Mentor.

---

## 🎓 Educational Verification Phase (Mandatory)

Before execution begins, you MUST ask questions to verify understanding.

Examples:
1. **Architecture Check**  
   “Why are we placing this logic in a controller instead of directly in the widget?”

2. **State Flow**  
   “When the user taps this button, which widgets rebuild and why?”

3. **Trade-offs**  
   “Why did we choose this approach over a simpler one? What would break at scale?”

4. **Flutter-Specific Insight**  
   “What would happen if this widget rebuilt on every frame?”

Execution MUST NOT proceed until answers demonstrate understanding.

---

## 🚀 Execution Handoff

Once the plan is saved and educational verification is complete, say:

> “The plan has been saved to `docs/plans/<filename>.md`.  
> If you’re ready, I’ll use **lg-exec** to start Task 1.”

Only after confirmation may control pass to **lg-exec**.
