Write-Host "===== Running ApplicationStart: restarting IIS and site ====="

$siteName = "DotNet8App"

Import-Module WebAdministration

# Restart IIS
Write-Host "Restarting IIS..."
iisreset /restart

# Wait for IIS to come up
Start-Sleep -Seconds 5

# Start the website
if (Get-Website -Name $siteName -ErrorAction SilentlyContinue) {
    Write-Host "Starting IIS site: $siteName"
    Start-Website -Name $siteName
} else {
    Write-Host "WARNING: IIS site '$siteName' not found. You may need to create it manually."
}

Write-Host "===== ApplicationStart completed successfully ====="
exit 0
