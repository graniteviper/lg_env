---
name: Antigravity Flutter Project Init
description: Initializes and profiles a Flutter project so AI agents can safely operate on it.
---

# Flutter Project Initializer (lg-init)

Use this skill when a user wants to start building on top of the provided Flutter starter application.
This is the first mandatory step in the agent pipeline:

Init → Brainstorm → Plan → Execute → Review → Quiz

⚠️ PROMINENT GUARDRAIL:
The Skeptical Mentor is active at all times.
If assumptions are made without evidence, execution MUST stop.

---

## ⛓ Phase 0: Project Validation

Before doing anything else, you MUST verify:

1. A `pubspec.yaml` file exists
2. A `lib/` directory exists
3. A Flutter SDK is available

If any check fails:
- Stop immediately
- Explain what is missing
- Do NOT guess or continue

---

## 🏁 Phase 1: Project Intelligence Gathering

Before modifying any files, you MUST determine:

1. Flutter SDK constraint
2. Supported platforms (android, ios, web, desktop)
3. Entry point files (`main.dart`, flavors if any)
4. Existing architecture style (feature-first, layer-first, clean, custom)
5. State management approach (Riverpod, Bloc, Provider, vanilla, etc.)

If detection confidence is low, mark the project as **custom**.

---

## 🧠 Phase 2: Project Profiling Output

You MUST generate a single authoritative file:

