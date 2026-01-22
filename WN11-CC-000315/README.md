
# WN11-CC-000315 – Always Install with Elevated Privileges

This folder covers **Windows 11 STIG control WN11-CC-000315**, which ensures that the Windows Installer feature **"Always install with elevated privileges"** is disabled. Disabling this setting prevents MSI installer packages from running with administrative permissions unless explicitly authorized.  

Tested on the Win11-VM01 sandbox environment.

---

## Table of Contents
- [Description](#description)
- [Risk / Impact](#risk--impact)
- [Detection](#detection)
- [Remediation](#remediation)
- [Validation](#validation)
- [References](#references)

---

## Description
This control ensures that standard users cannot install MSI packages with elevated privileges. Disabling this feature is a simple but important part of hardening Windows 11 systems.  

<summary>Initial Compliance Scan Screenshot</summary>

Screenshot from the initial Tenable.io scan in the lab environment.*
</details>

<img width="944" height="361" alt="Screenshot 2026-01-22 210129" src="https://github.com/user-attachments/assets/1169fcb0-33dc-4238-af09-8e318d6ea91d" />

---

## Risk / Impact
If this setting is enabled, standard users could install MSI packages with administrative rights. This creates a **local privilege escalation risk**, potentially allowing attackers to:

- Install malicious software  
- Fully compromise the system  

During testing, unprivileged MSI packages could run if this setting was not disabled.

---

## Detection
The finding was identified using a **DISA STIG audit scan** in **Tenable.io** against a Windows 11 virtual machine.  

Note: This scan was part of the baseline compliance assessment.

---

## Remediation
Set the registry value AlwaysInstallElevated to `0 under:

HKLM\Software\Policies\Microsoft\Windows\Installer

This disables elevated MSI installations for all users.

*Tip: When deploying via Group Policy, ensure the change is enforced across all relevant organizational units.*

---

## Validation

A follow-up STIG scan in Tenable.io confirmed that the setting is **remediated** and passes the control.

<summary>Passed Scan Screenshot</summary>

<img width="1057" height="394" src="https://github.com/user-attachments/assets/eb2bc6d5-dc11-405e-92ee-4c3f79555872" alt="Passed Scan Screenshot" />

Confirms the registry change was applied successfully.

</details>

---

## References

* [DISA STIG Viewer – Windows 11 STIG](https://www.stigviewer.com/stigs/microsoft-windows-11-security-technical-implementation-guide)
* [Tenable.io Documentation](https://www.tenable.com/products/tenable-io)

---

*Notes:*

* All testing was performed in a controlled lab environment.
* Screenshots reflect scan results from the test VM and may differ in other environments.
