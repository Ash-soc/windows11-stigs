# WN11-AC-000010 – Account Lockout Threshold

This folder documents the remediation of Windows 11 STIG control WN11-AC-000010, which limits failed login attempts.

**Test Environment:** Win11-VM01

---

## Description

This control locks user accounts after a defined number of failed authentication attempts, helping mitigate brute-force attacks.

---

## Before Remediation

🖼️ **Before Scan Screenshot**

`before-scan.png`

---

## Risk / Impact

Without an account lockout threshold, attackers can attempt unlimited password guesses without restriction.

---

## Remediation

The account lockout threshold was set to three failed login attempts.

---

## Validation

🖼️ **After Scan Screenshot**

`after-scan.png`

---

## SOC Interview Explanation

“Lockout thresholds help prevent brute-force attacks and generate useful telemetry when attackers repeatedly fail authentication.”

---

## References

- DISA STIG Viewer – Windows 11 STIG
