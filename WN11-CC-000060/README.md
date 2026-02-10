# WN11-AU-000070 – Audit Logon Failures

This folder documents the remediation of Windows 11 STIG control **WN11-AU-000070**, which requires auditing of failed logon attempts.

This control was identified during a Windows 11 STIG compliance assessment and remediated in a controlled lab environment.

---

## 🔎 Description

This control ensures that failed logon attempts are recorded in the Windows Security Event Log.

When properly configured, the system generates:

- **Event ID 4625** – Failed logon attempt

These logs are essential for:

- Detecting brute-force attacks  
- Identifying password spraying  
- Monitoring credential abuse  
- Supporting forensic investigations  

---

## 🖼️ Before Remediation

At the time of assessment, the Advanced Audit Policy setting for failed logon attempts was not fully configured in accordance with STIG requirements.

The system was not generating Event ID 4625 consistently.

---

## ⚠️ Risk / Impact

Without auditing failed logon attempts:

- Brute-force attacks may go undetected  
- Password spraying campaigns may not be identified  
- Suspicious authentication patterns cannot be investigated  
- Incident response teams lose critical forensic visibility  

Authentication logging is a foundational detection control in enterprise environments.

---

## 🛠️ Remediation (PowerShell-Based)

The control was remediated using PowerShell to configure Advanced Audit Policy.

### 1️⃣ Enable Audit Logon Failures

```powershell
auditpol /set /subcategory:"Logon" /failure:enable
````

This command enables auditing for failed logon attempts.

---

### 2️⃣ Verify Configuration

```powershell
auditpol /get /subcategory:"Logon"
```

Expected output:

```
Logon
  Success  : Disabled
  Failure  : Enabled
```

This confirms that failed logon auditing is active.

---

## ✅ Validation

### 1️⃣ Functional Testing

A test failed logon attempt was performed using invalid credentials.

### 2️⃣ Event Log Verification

PowerShell was used to confirm that Event ID 4625 was generated:

```powershell
Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4625} -MaxEvents 5
```

Successful output confirmed that failed logon events were recorded in the Security log.
---

## 📊 Technical Details

* **Relevant Event ID:** 4625
* **Log Location:** Windows Logs → Security
* **Audit Subcategory:** Logon

Event ID 4625 includes key forensic details such as:

* Account name
* Source IP address
* Logon type
* Failure reason
* Authentication package

---

> "Failed logon auditing is one of the most important early detection controls in a SOC. Event ID 4625 allows analysts to detect brute-force attempts, password spraying campaigns, and suspicious authentication patterns. Without this visibility, attackers can attempt credential abuse with minimal detection risk."

---

## 📚 References

* DISA Windows 11 STIG
  [https://public.cyber.mil/stigs/](https://public.cyber.mil/stigs/)

* Microsoft Windows Security Auditing Documentation
  [https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/basic-security-audit-policy-settings](https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/basic-security-audit-policy-settings)

* NIST SP 800-61 – Computer Security Incident Handling Guide
  [https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-61r2.pdf](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-61r2.pdf)
