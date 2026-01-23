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

# Step 5: Verification
$scriptBlock = Get-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
$module = Get-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ModuleLogging"

Write-Host "`n=== Verification ===`n"
Write-Host "Script Block Logging Enabled:" $scriptBlock.EnableScriptBlockLogging
Write-Host "Module Logging Enabled:" $module.EnableModuleLogging
