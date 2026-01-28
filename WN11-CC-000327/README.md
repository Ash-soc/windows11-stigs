# WN11-CC-000327 – PowerShell Transcription

This folder documents the remediation of Windows 11 STIG control WN11-CC-000327, which requires PowerShell Transcription to be enabled.

Tested on the Win11-VM01 sandbox environment.

---

## Description

PowerShell Transcription captures full PowerShell sessions, including command input and output, providing context during security investigations.

---

## Before Remediation

🖼️ **Before Scan Screenshot**

`before-scan.png`

---

## Risk / Impact

Without transcription enabled, important context around PowerShell activity may be missing during incident response.

---

## Detection

Identified using a DISA Windows 11 STIG compliance scan with Tenable.io.

---

## Remediation

PowerShell Transcription was enabled via Group Policy.

Computer Configuration → Administrative Templates → Windows Components → Windows PowerShell → Turn on PowerShell Transcription

---

## Validation

🖼️ **After Scan Screenshot**

`after-scan.png`

---

## SOC Interview Explanation

PowerShell Transcription helps SOC analysts reconstruct full attack timelines by showing entire PowerShell sessions.

---

## References

DISA STIG Viewer – Windows 11 STIG
