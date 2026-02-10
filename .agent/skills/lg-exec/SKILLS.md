---
name: Antigravity Flutter Plan Executor
description: >
  Use when a written implementation plan exists (from lg-plan-writer)
  to execute Flutter code changes in controlled batches with continuous
  verification and educational validation.
---

# Executing Flutter Implementation Plans

## Overview

Execute approved Flutter implementation plans in small, verifiable batches.

This is the fourth step in the mandatory pipeline:

Init → Brainstorm → Plan → Execute → Review → Quiz (Finale)

⚠️ PROMINENT GUARDRAIL:
Do NOT act like a coding robot.
If the user disengages, says “just continue,” or skips reasoning,
you MUST pause and trigger the Skeptical Mentor.

You MUST announce at the start:
> “I’m using the lg-exec skill to implement the <Feature Name> plan.”

---

## 🧾 Step 1: Load and Review Plan

You MUST:

1. Load the plan file from `docs/plans/`
2. Verify it follows the required plan format
3. Identify any architectural risks or ambiguities
4. Confirm alignment with `project_profile.json`

If concerns exist:
- Raise them immediately
- Do NOT start execution until resolved

---

## ⚙️ Step 2: Execute in Batches

Default batch size: **2–3 tasks**

For each batch:

### For each task in the batch

1. Mark task as `in_progress`
2. Follow the task steps exactly
3. Briefly explain:
   - What this task does
   - Why it exists architecturally
4. Apply code changes
5. Run verifications:
   - Interact with the UI
   - Observe widget rebuild behavior
   - Confirm state updates flow correctly
6. Run quality checks:
   - `flutter analyze`
7. Run tests if applicable:
   - `flutter test`
8. Commit with a clear message:
   ```bash
   git commit -m "feat: <task name>"

If any verification fails:

Stop

Diagnose

Explain the issue

Do NOT guess or continue

Step 3: Batch Educational Report

After each batch, you MUST report:

What was built

Verification results

Engineering principles applied
(e.g., separation of concerns, state ownership, rebuild minimization)

Performance considerations
(e.g., which widgets rebuild and why)

Checklist update

Mark completed tasks in the plan document

You MUST append a short entry to:

docs/learning-journal.md

Step 4: Continue or Pause

Ask explicitly:

“Ready for the next batch?
Does the architecture still make sense to you?”

Do NOT proceed without confirmation.

🏁 Step 5: Completion and Review Handoff

After all tasks are complete:

Perform a final run of:

flutter analyze

flutter test (if applicable)

Verify UI behavior end-to-end

Mark the plan as complete

Ask:

“Implementation is complete. Ready for a professional code review?”

If yes, hand control to lg-code-reviewer.


When to Stop Immediately

You MUST pause execution if:

The plan has gaps or contradictions

Verification repeatedly fails

The user disengages or skips reasoning

You are unsure how to proceed

Do NOT guess.
Trigger the Skeptical Mentor if needed.

Key Principles to Reinforce

Plan-driven execution only

Small, reversible changes

Continuous verification

Educational explanations are mandatory

Flutter performance awareness

Stop when blocked


---

## 4️⃣ Runtime enforcement (this is critical)

When `lg-exec` is active, Antigravity MUST enforce:

### Tool permissions
- ✅ Modify `lib/`
- ✅ Modify `test/`
- ✅ Run `flutter analyze` / `flutter test`
- ❌ Modify plans except checklist updates
- ❌ Skip tasks
- ❌ Redesign features

### State tracking
- Current task
- Current batch
- Verification status
- User engagement status

### Hard blocks
- No batch > 3 tasks
- No execution without plan
- No execution if mentor blocks

---

## 5️⃣ Why this works (validation)

| Web lg-exec | Flutter lg-exec |
|------------|----------------|
| Sync checks | Rebuild & state flow checks |
| npm lint | flutter analyze |
| Chrome tabs | UI interaction |
| Learning journal | Learning journal |
| Batch execution | Batch execution |

Same discipline. Different stack.

---

## 6️⃣ Where you are now

You’ve now locked **five stages**:

- Root README
- `lg-init`
- `lg-brainstormer`
- `lg-plan-writer`
- `lg-exec`

What’s left are the *inspection* and *guardrail* agents.

---

## Next (choose one, strongly recommended order)

1. **lg-code-reviewer** (very important)  
2. **lg-skeptical-mentor** (defines system safety)  
3. **lg-quiz-master** (nice, but last)  
4. **Antigravity core loop pseudo-code**

My recommendation: **lg-code-reviewer next**.
