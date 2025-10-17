Write-Host "Running BeforeInstall: Stopping existing app..."

# Stop IIS website or your service
# Example: if your app runs as a Windows service
$serviceName = "DotNet8App"
if (Get-Service $serviceName -ErrorAction SilentlyContinue) {
    Stop-Service -Name $serviceName -Force
    Write-Host "Service $serviceName stopped successfully."
}

# Optional: Clean old files before copying new ones
Write-Host "Cleaning old files..."
Remove-Item -Recurse -Force C:\websites\DotNetApp\* -ErrorAction SilentlyContinue
Write-Host "BeforeInstall completed."
