# WN11-CC-000345 – Disable SMBv1 Protocol

This folder documents the remediation of Windows 11 STIG control WN11-CC-000345, which requires the Server Message Block version 1 (SMBv1) protocol to be disabled.

This control was identified during a DISA Windows 11 STIG audit scan and remediated in a controlled lab environment.

**Test Environment:** Win11-VM01 (Windows 11 virtual machine)

---

## Description

SMBv1 is a legacy file-sharing protocol that is no longer considered secure. It lacks modern security protections and has been exploited in multiple high-profile attacks.

Disabling SMBv1 reduces the attack surface and helps prevent exploitation of known vulnerabilities associated with the protocol.

---

## Before Remediation

🖼️ **Before Scan Screenshot**  
*Insert Tenable.io scan showing WN11-CC-000345 reported as a finding.*

`before-scan.png`

---

## Risk / Impact

If SMBv1 is enabled, the system may be vulnerable to network-based attacks. Risks include:

- Exploitation of known SMBv1 vulnerabilities  
- Wormable malware propagation  
- Unauthorised access to file-sharing services  

SMBv1 has been used in past ransomware outbreaks, making it a high-risk legacy protocol.

---

## Detection

This finding was detected using a DISA Windows 11 STIG compliance scan performed with Tenable.io as part of baseline security testing.

---

## Remediation

The SMBv1 protocol was disabled using Windows feature configuration.

This can be enforced via Group Policy or PowerShell to ensure SMBv1 is not enabled on the system.

---

## Validation

🖼️ **After Scan Screenshot**  
*Insert Tenable.io scan confirming WN11-CC-000345 is compliant.*

`after-scan.png`

A follow-up STIG scan confirmed SMBv1 is disabled and the system is compliant.

---

## SOC Interview Explanation

“SMBv1 is a legacy protocol with known vulnerabilities. Disabling it reduces the attack surface and helps prevent network-based exploitation and lateral movement, which are common SOC investigation scenarios.”

---

## References

- DISA Security Technical Implementation Guide (STIG) – Microsoft Windows 11  
  https://public.cyber.mil/stigs/

- DISA STIG Viewer – Windows 11  
  https://www.stigviewer.com/stig/windows_11/

- Microsoft SMB Security Documentation  
  https://learn.microsoft.com/en-us/windows-server/storage/file-server/troubleshoot/detect-enable-and-disable-smbv1-v2-v3

- Tenable Nessus Documentation  
  https://docs.tenable.com/

