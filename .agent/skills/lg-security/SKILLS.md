---
name: Android Security Manifest
description: Mandatory security standards for the Antigravity Flutter environment.
---

# Android Security Standards 🔐

## 1. Data at Rest (Storage)
- **Zero Plain-Text Rule:** Sensitive data (SSH Passwords, Rig IPs, User Tokens) MUST NOT be stored in `SharedPreferences` or `sqflite` without encryption.
- **Implementation:** Use `flutter_secure_storage`. 
- **Android Specifics:** Ensure `encryptedSharedPreferences: true` is set in the Android options of the plugin.

## 2. Network Security (The Rig Connection)
- **SSH Integrity:** When using `dartssh2` or similar for Liquid Galaxy communication:
  - Prefer **SSH Keys** over passwords.
  - If passwords must be used, they must be cleared from memory immediately after the connection is established.
- **Traffic Policy:** `android:usesCleartextTraffic` must be `false` in `AndroidManifest.xml`. If the rig requires HTTP, create a `network_security_config.xml` to allow ONLY that specific IP.

## 3. Android App Integrity
- **Permissions:** Follow the **Principle of Least Privilege**.
  - ❌ No `READ_EXTERNAL_STORAGE` unless strictly required for KML local files.
  - ✅ Use `INTERNET` and `ACCESS_NETWORK_STATE` only.
- **Obfuscation:** All production builds must use `--obfuscate` to prevent reverse-engineering of the LG controller logic.

## 4. Dependency Safety
- **Audit:** The agent must run `flutter pub outdated` once per feature cycle.
- **Bloat:** Avoid "Kitchen Sink" plugins. If a plugin requires excessive Android permissions, it must be rejected by the Reviewer.