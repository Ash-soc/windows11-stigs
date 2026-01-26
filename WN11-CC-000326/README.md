# **WN11-CC-000326 – PowerShell Script Block Logging**

**STIG ID:** WN11-CC-000326
**Title:** PowerShell Script Block Logging must be enabled on Windows 11
**Severity:** Medium

---

## **Description**

PowerShell Script Block Logging is a security feature that records the content of all PowerShell scripts and commands executed on a system. Enabling this logging is critical for auditing and detecting suspicious or malicious activity. Without it, attackers can execute scripts without leaving a traceable log, making threat detection much more difficult.

This STIG ensures that all PowerShell activity is logged, helping administrators monitor and respond to potential security incidents effectively.

---

## **Remediation Steps**

1. **Enable Script Block Logging via Group Policy**

   * Open **gpedit.msc** as Administrator.
   * Navigate to:

     
     Computer Configuration → Administrative Templates → Windows Components → Windows PowerShell → Turn on PowerShell Script Block Logging
     
   * Double-click the setting → select **Enabled** → Click **Apply → OK**.

   ### **Before Remediation**

   ![Insert before GPEDIT screenshot here](images/before_gpedit.png)

   ### **After Remediation**

   ![Insert after GPEDIT screenshot here](images/after_gpedit.png)

2. **Apply Group Policy Changes**

   Open **PowerShell as Administrator** and run:

   gpupdate /force
   

3. **Optional: Enable Script Block Logging via PowerShell Script (Registry Method)**

   For systems without Group Policy Editor or for automation, run the following PowerShell script:

   ```powershell
   # Run as Administrator

   # Step 1: Create ScriptBlockLogging key if missing
   New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell" -Name "ScriptBlockLogging" -Force

   # Step 2: Enable Script Block Logging
   New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" `
   -Name "EnableScriptBlockLogging" -Value 1 -PropertyType DWord -Force

   # Step 3: Create ModuleLogging key if missing
   New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell" -Name "ModuleLogging" -Force

   # Step 4: Enable Module Logging
   New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ModuleLogging" `
   -Name "EnableModuleLogging" -Value 1 -PropertyType DWord -Force
   ```

   ### **Before Registry Change**

   ![Insert before registry screenshot here](images/before_registry.png)

   ### **After Registry Change**

   ![Insert after registry screenshot here](images/after_registry.png)

---

## **Verification**

After remediation, confirm that Script Block Logging is enabled:

1. **Registry Verification**

   Run in PowerShell as Administrator:

   ```powershell
   Get-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
   ```

   Expected output:

   ```
   EnableScriptBlockLogging : 1
   ```

   Similarly, check Module Logging:

   ```powershell
   Get-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ModuleLogging"
   ```

   Expected output:

   ```
   EnableModuleLogging : 1
   ```

2. **Event Log Verification**

   * Open **Event Viewer** → `Applications and Services Logs → Microsoft → Windows → PowerShell → Operational`
   * Look for **Event ID 4104**, which confirms Script Block Logging is active.

   You can also use PowerShell to verify recent events:

   ```powershell
   Get-WinEvent -LogName "Microsoft-Windows-PowerShell/Operational" -MaxEvents 5 | Select-Object TimeCreated, Id, Message
   ```

---

## **Evidence**

Use this section to attach screenshots as proof of remediation and verification. Replace placeholders with your actual images.

* **Before GPEDIT**: ![before GPEDIT](images/before_gpedit.png)
* **After GPEDIT**: ![after GPEDIT](images/after_gpedit.png)
* **Before Registry Change**: ![before registry](images/before_registry.png)
* **After Registry Change**: ![after registry](images/after_registry.png)
* **Event Log Showing Script Block Logging**: ![event log](images/eventlog.png)

---

## **Status**

* ✅ Compliant – Script Block Logging is enabled
* ✅ Compliant – Module Logging is enabled
* All changes verified in registry and Event Viewer

---

## **References**

* [Microsoft Docs – PowerShell Script Block Logging](https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/effective-powershell-logging?view=powershell-7.3)
* [DISA STIG – Windows 11 Security Technical Implementation Guides](https://public.cyber.mil/stigs/)

If you want, I can now also **create a fully matching `enable-scriptblocklogging.ps1`** with **verification and PASS/FAIL output** so it’s perfect for your GitHub repo — meaning you can run it and see immediately if the STIG is compliant.

Do you want me to do that?
