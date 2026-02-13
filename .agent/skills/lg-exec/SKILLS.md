---
name: Antigravity Flutter Plan Executor
description: >
  Executes Flutter code changes using SOLID principles, 
  integrated unit testing, and incremental Agile batches.
---

# Executing Flutter Implementation Plans

## Overview
Execute approved plans in small, verifiable batches. 

This stage transforms the plan into **clean, production-ready, and tested code**. It is the engine of the "Definition of Done."

---

## ⚙️ Step 2: Execute in Batches (The SOLID/Agile Loop)

Default batch size: **2–3 tasks**. 

For each task in the batch:

### 1. Implementation & Architecture (SOLID/Agile)
- **Constraint:** Write code that follows **SOLID** principles. 
- **Guideline:** If a function or widget becomes too complex, refactor it into smaller, reusable components *before* moving to the next task.
- **Explain:** The agent MUST explain which SOLID principle influenced the code structure (e.g., "I separated the KML logic from the UI to follow the Single Responsibility Principle").

### 2. Integrated Unit Testing (Mandatory)
- **Action:** For every logic class or service created, the agent **MUST** create a corresponding test file in `/test`.
- **Requirement:** You cannot mark a task as complete if it lacks a test or if existing tests fail.
- **Tooling:** Run `flutter test` after every file modification.



### 3. Verification & Pruning Check
- **Verification:** Confirm state updates flow correctly.
- **Skeleton Assessment:** If the task replaces a piece of "Skeleton Kit" functionality, the agent must note: *"This task supersedes [Skeleton Function X]. It is now a candidate for removal."*

---

## 🧾 Step 3: Batch Educational Report

After each batch, you MUST report:

1. **What was built:** Summary of features.
2. **SOLID Verification:** How the code was kept "clean" and "reusable."
3. **Test Status:** - ✅ List of new tests created.
   - 📈 Current project test coverage.
4. **Skeleton Cleanup Progress:** - Identify functions that are now "Dead Code" due to this batch.

---

## 🏁 Step 5: Completion and Review Handoff

Before handing off to `lg-code-reviewer`, the agent must:
1. Run a final `flutter analyze` (**Zero errors allowed**).
2. Run `flutter test` (**100% pass rate**).
3. **Final Pruning Audit:** - Ask: *"I have identified that the following skeleton files are no longer used by the new implementation. Should I prune them now to keep the repo clean?"*

---

## 4️⃣ Runtime enforcement (non-negotiable)

When `lg-exec` is active, Antigravity MUST enforce:

### Tool permissions
- ✅ **Modify `test/`:** You are required to write tests alongside features.
- ❌ **No "Spaghetti" code:** If a function exceeds 40 lines, the agent must self-correct and refactor immediately.
- ❌ **Skip Verification:** You cannot move to the next batch if `flutter analyze` fails.

### Hard blocks
- **No Test, No Progress:** If a logic-heavy task is finished without a test file, the agent is blocked.
- **No Skeleton Bloat:** The agent must actively look for opportunities to remove starter code once it is no longer needed.

---

## Summary of Logic Added

| Feature | Change in `lg-exec` |
| :--- | :--- |
| **Testing** | Added as a mandatory sub-step for every task. |
| **SOLID/Agile** | Added as a "Constraint" during the coding process with mandatory explanation. |
| **Skeleton Pruning** | Added a "Pruning Audit" at the end of the batch and final handoff. |

---

### Next Step
We have the **Executor** (writing tested, clean code) and the **Reviewer** (verifying it). The last major piece is the **Skeptical Mentor**, who acts as the "Brain" to make sure the agent doesn't just go through the motions.

**Would you like me to draft the `lg-skeptical-mentor.md` next to tie these quality checks together?**