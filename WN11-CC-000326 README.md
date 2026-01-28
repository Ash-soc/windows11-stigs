# WN11-CC-000326 – PowerShell Script Block Logging

This folder documents the remediation of Windows 11 STIG control WN11-CC-000326, which requires PowerShell Script Block Logging to be enabled.

Tested on the Win11-VM01 sandbox environment.

---

## Description

PowerShell Script Block Logging records the full contents of PowerShell scripts and commands as they are executed, including dynamically generated or obfuscated code. Because PowerShell is a trusted and powerful tool built into Windows, it is commonly abused by attackers during post-exploitation.

---

## Before Remediation

🖼️ **Before Scan Screenshot**  
*Insert Tenable.io scan showing this control as non-compliant.*

`before-scan.png`

---

## Risk / Impact

Without Script Block Logging enabled, malicious PowerShell activity may execute without sufficient forensic evidence. This limits the SOC’s ability to detect, investigate, and respond to PowerShell-based attacks.

---

## Detection

This finding was identified using a DISA Windows 11 STIG compliance scan performed with Tenable.io.

---

## Remediation

PowerShell Script Block Logging was enabled using Group Policy.

Computer Configuration → Administrative Templates → Windows Components → Windows PowerShell → Turn on PowerShell Script Block Logging

---

## Validation

🖼️ **After Scan Screenshot**  
*Insert Tenable.io scan confirming compliance.*

`after-scan.png`

A follow-up scan confirmed the system is compliant with WN11-CC-000326.

---

## SOC Interview Explanation

Script Block Logging allows SOC analysts to see the exact PowerShell commands that were executed, which is critical for investigating fileless and post-exploitation attacks.

---

## References

DISA STIG Viewer – Windows 11 STIG  
Tenable.io Documentation
