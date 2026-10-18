
$ErrorActionPreference = "Stop"
$serviceName = "Velociraptor"
$changes = 0

Write-Host "Checking Velociraptor agent..."

$service = Get-CimInstance Win32_Service -Filter "Name='Velociraptor'"

if ($null -eq $service) {
    Write-Host "Agent is not installed."
    exit 2
}

Write-Host "Agent is installed."

if ($service.StartMode -ne "Auto") {
    Set-Service -Name $serviceName -StartupType Automatic
    $changes++
}

if ($service.State -ne "Running") {
    Start-Service -Name $serviceName
    $changes++
}

$service = Get-CimInstance Win32_Service -Filter "Name='Velociraptor'"

Write-Host "Status: $($service.State)"
Write-Host "Startup: $($service.StartMode)"
Write-Host "CHANGED=$changes"

