Write-Host "Running ApplicationStart: Restarting app..."

# Example for IIS
iisreset /restart

# OR for a Windows service
$serviceName = "DotNet8App"
if (Get-Service $serviceName -ErrorAction SilentlyContinue) {
    Start-Service -Name $serviceName
    Write-Host "Service $serviceName started successfully."
} else {
    Write-Host "Service not found. You may need to install it first."
}

Write-Host "ApplicationStart completed."
