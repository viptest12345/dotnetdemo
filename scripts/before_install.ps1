Write-Host "===== Running BeforeInstall: stopping IIS site and cleaning old files ====="

$siteName = "DotNet8App"
$webRoot = "C:\websites\DotNetApp"

# Stop IIS site if running
Import-Module WebAdministration
if (Get-Website -Name $siteName -ErrorAction SilentlyContinue) {
    Write-Host "Stopping IIS site: $siteName"
    Stop-Website -Name $siteName
} else {
    Write-Host "IIS site '$siteName' not found. Skipping stop."
}

# Clean old files safely
if (Test-Path $webRoot) {
    Write-Host "Cleaning old files in $webRoot ..."
    Get-ChildItem -Path $webRoot -Recurse -Force | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
} else {
    Write-Host "Folder not found, creating new folder..."
    New-Item -ItemType Directory -Force -Path $webRoot | Out-Null
}

Write-Host "===== BeforeInstall completed successfully ====="
exit 0
