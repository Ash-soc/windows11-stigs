# WN11-SO-000205 – LAN Manager Authentication Level
# Sets LmCompatibilityLevel to 5 (NTLMv2 only)

$RegistryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"
$ValueName = "LmCompatibilityLevel"
$RequiredValue = 5

Write-Host "Checking current LAN Manager authentication level..." -ForegroundColor Cyan

# Check current value
$currentValue = (Get-ItemProperty -Path $RegistryPath -Name $PropertyName -ErrorAction SilentlyContinue).LmCompatibilityLevel

if ($currentValue -eq $RequiredValue) {
    Write-Host "System is already compliant (LmCompatibilityLevel = 5)." -ForegroundColor Green
}
else {
    Write-Host "System is NOT compliant. Applying remediation..." -ForegroundColor Yellow

    # Set required value
    Set-ItemProperty -Path $RegistryPath `
        -Name $ValueName `
        -Value $RequiredValue `
        -Type DWord

    Write-Host "Remediation applied." -ForegroundColor Green
}

# Final validation
$updatedValue = (Get-ItemProperty -Path $RegistryPath -Name $PropertyName).LmCompatibilityLevel
Write-Host "Current LmCompatibilityLevel:" $updatedValue -ForegroundColor Cyan
