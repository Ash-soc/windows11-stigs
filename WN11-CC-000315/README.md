WN11-CC-000315 – Always Install with Elevated Privileges

Description

This STIG ensures that the Windows Installer feature "Always install with elevated privileges" is disabled on Windows 11 systems. Disabling this setting prevents MSI installer packages from running with administrative permissions unless explicitly authorized.

Risk / Impact

If this setting is enabled, standard users can install MSI packages with elevated privileges. This creates a local privilege escalation risk and may allow attackers to install malicious software or fully compromise the system.

Detection
This finding was identified using a DISA STIG audit scan in Tenable.io against a Windows 11 virtual machine.

## Remediation
The registry value `AlwaysInstallElevated` was set to `0` under: HKLM\Software\Policies\Microsoft\Windows\Installer

## Validation
A follow-up STIG scan in Tenable.io confirmed that the finding was remediated and is now in a passed state.
