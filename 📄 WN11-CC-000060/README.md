# WN11-CC-000060 – Screen Lock Inactivity Timeout

This folder documents the remediation of Windows 11 STIG control WN11-CC-000060, which requires the system to automatically lock after a defined period of user inactivity.

This control was identified during a DISA Windows 11 STIG compliance scan and remediated in a controlled lab environment.

**Test Environment:** Win11-VM01 (Windows 11 virtual machine)

---

## Description

This control enforces an inactivity timeout that locks the user session after a period of inactivity. Automatic screen locking helps prevent unauthorised access when a workstation is left unattended.

This is a fundamental security control in enterprise environments, particularly in shared or office-based settings.

---

## Before Remediation

🖼️ **Before Scan Screenshot**  
*Insert Tenable.io scan showing WN11-CC-000060 reported as a finding.*

`before-scan.png`

---

## Risk / Impact

If an inactivity timeout is not enforced, unattended systems may remain logged in and accessible. This increases the risk of:

- Unauthorised access to sensitive information  
- Insider misuse  
- Lateral movement by attackers with physical access  

Unattended unlocked sessions are a common real-world security risk.

---

## Detection

This finding was detected using a DISA Windows 11 STIG compliance scan performed with Tenable.io as part of a baseline security assessment.

---

## Remediation

The screen lock timeout was configured using Group Policy.

Computer Configuration → Windows Settings → Security Settings → Local Policies → Security Options  
**Interactive logon: Machine inactivity limit**

The inactivity limit was set in accordance with STIG requirements.

---

## Validation

🖼️ **After Scan Screenshot**  
*Insert Tenable.io scan confirming WN11-CC-000060 is compliant.*

`after-scan.png`

A follow-up compliance scan confirmed the control was successfully remediated.

---

## SOC Interview Explanation

“This control helps prevent unauthorised access when a user leaves their workstation unattended. From a SOC perspective, it reduces the risk of physical access leading to account compromise or data exposure.”

---

## References

- DISA STIG Viewer – Windows 11 STIG  
- Tenable.io Documentation
