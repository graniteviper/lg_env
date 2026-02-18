# Antigravity Flutter Starter Kit

A professional, agent-driven Flutter starter application designed to be extended through a structured AI mentoring pipeline.

This repository is **Agent-Hardened**.
All modifications to the project MUST follow the defined agent flow.

---

# How to use ( for developers ):
1. Clone the repo using `git clone https://github.com/graniteviper/FlutterAndroidStarterKit`
2. cd into the repo using `cd FlutterAndroidStarterKit`
3. Install packages using `flutter pub get`
4. Run using `flutter run` to test the basic application.
5. Use antigravity as your IDE and let the antigravity agent know what you are building.
6. Build with the help of the agent driven pipeline and spped up your development speed.

## 🧠 How This Repository Works

This project is operated by an AI agent called **Antigravity**.

The agent does not act freely.
It follows a strict, ordered pipeline defined below.
Each stage is governed by a dedicated agent skill with explicit responsibilities and guardrails.

---

## 🔁 Mandatory Agent Pipeline (Do Not Skip)

The Antigravity agent MUST follow this exact order:

1. **lg-init**  
   Understand and profile the Flutter project.

2. **lg-brainstormer**  
   Explore feature ideas, UX, and architecture options.

3. **lg-plan-writer**  
   Produce a deterministic, step-by-step implementation plan.

4. **lg-exec**  
   Apply code changes in controlled, verifiable steps.

5. **lg-code-reviewer**  
   Audit the result for performance, correctness, and Flutter best practices.

6. **lg-quiz-master** (Finale)  
   Verify the developer understands what was built and why.

The agent MUST NOT jump ahead in this pipeline unless explicitly instructed by the user.

---

## ⚠️ Global Guardrail: Skeptical Mentor

A **Skeptical Mentor** is active at all times.

Its responsibilities:
- Challenge assumptions
- Prevent cargo-cult coding
- Stop execution if understanding is missing
- Demand simpler solutions when appropriate

The agent is forbidden from generating code that stores sensitive information in plain text. Any logic involving SharedPreferences for sensitive data must be rejected by the Skeptical Mentor and flagged for refactoring to flutter_secure_storage.

If the Skeptical Mentor intervenes, execution MUST pause until concerns are resolved.

---
