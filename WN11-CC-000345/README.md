# WN11-CC-000345 – Disable SMBv1 Protocol

This folder documents the remediation of Windows 11 STIG control **WN11-CC-000345**, which requires the Server Message Block version 1 (SMBv1) protocol to be disabled.

This control was identified during a DISA Windows 11 STIG compliance assessment and remediated in a controlled lab environment.

**Test Environment:**  
Win11-VM01 (Windows 11 Virtual Machine)

---

## 🔎 Description

SMBv1 is a legacy file-sharing protocol that lacks modern security protections such as:

- Secure negotiation
- Improved authentication handling
- Enhanced encryption

Due to its design limitations, SMBv1 has been exploited in multiple high-profile attacks and is considered insecure.

STIG requires SMBv1 to be disabled to reduce exposure to network-based threats.

---

## ⚠️ Risk / Impact

If SMBv1 is enabled, the system may be vulnerable to:

- Exploitation of known SMBv1 vulnerabilities  
- Wormable malware propagation  
- Unauthorised access to file-sharing services  
- Lateral movement across networked systems  

Legacy protocols like SMBv1 significantly increase attack surface and are commonly targeted during internal network compromise.

---

## 🔍 Detection

This finding was identified through:

- DISA Windows 11 STIG compliance scan  
- Tenable vulnerability assessment  
- Windows Feature configuration review  

The system was confirmed to have SMBv1 enabled prior to remediation.

---

## 🛠️ Remediation

SMBv1 was disabled by removing the SMB 1.0/CIFS File Sharing Support feature.

This can be configured via:

Windows Features:

```

Control Panel → Programs → Turn Windows features on or off
→ SMB 1.0/CIFS File Sharing Support → Unchecked

```

Or enforced centrally via:

- Group Policy
- Configuration Management
- Endpoint hardening baseline

---

## ✅ Validation

Validation was performed using feature inspection and configuration review.

SMBv1 status was verified by confirming the Windows feature was removed and no longer enabled.

Additionally, the following was reviewed:

- SMB server configuration
- Feature installation state

The system no longer supports SMBv1 communication.

A follow-up STIG compliance scan confirmed the control is compliant.

---

## 📊 Technical Details

**Windows Feature:**
```

SMB1Protocol

```

SMBv1 must be:

```

Disabled / Not Installed

```

SMBv2 and SMBv3 remain enabled to support secure file-sharing operations.

---

> “SMBv1 is a legacy protocol with known security weaknesses and has been used in large-scale ransomware and worm-based attacks. Disabling it reduces the attack surface and prevents exploitation of outdated file-sharing services. From a SOC perspective, this reduces lateral movement risk and network-based compromise vectors.”

---

## 📚 References

- DISA Windows 11 STIG  
  https://public.cyber.mil/stigs/

- Microsoft SMB Security Documentation  
  https://learn.microsoft.com/en-us/windows-server/storage/file-server/troubleshoot/detect-enable-and-disable-smbv1-v2-v3

- Tenable Documentation  
  https://docs.tenable.com/

---
