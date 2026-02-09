# WN11-AC-000040 – Password Complexity Requirements

This folder documents the remediation of Windows 11 STIG control **WN11-AC-000040**, which enforces password complexity requirements.

---

## 🔎 Description

This control ensures that passwords meet defined complexity standards.  
When enabled, passwords must contain characters from multiple categories, such as:

- Uppercase letters  
- Lowercase letters  
- Numbers  
- Special characters  

The goal is to prevent the use of simple or easily guessable passwords.

---

## 🖼️ Before Remediation

At the time of assessment, password complexity requirements were not fully enforced in accordance with STIG guidance.

---

## ⚠️ Risk / Impact

Weak or predictable passwords significantly increase the risk of:

- Brute-force attacks  
- Credential stuffing  
- Password spraying  
- Unauthorised account access  

If complexity requirements are not enforced, attackers can more easily compromise both standard and privileged accounts.

---

## 🛠️ Remediation Steps

Password complexity was enabled using Group Policy.

**Path:**  
Local Security Policy → Account Policies → Password Policy →  
**Password must meet complexity requirements** → Enabled

The policy was configured to ensure passwords contain a mix of character types and are not based on easily guessable patterns.

---

## ✅ Validation

After applying the policy change, the configuration was reviewed to confirm compliance.


A follow-up scan confirmed the system is compliant with STIG requirements.

---

> “Enforcing password complexity reduces the likelihood of successful brute-force, spraying, and credential-based attacks. It strengthens authentication controls and lowers the volume of account compromise incidents that a SOC team may need to investigate.”

---

## 📚 References

- DISA STIG Viewer – Windows 11 STIG  
- NIST SP 800-63 Digital Identity Guidelines
