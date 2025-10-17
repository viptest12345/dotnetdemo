Write-Host "===== Running AfterInstall: verifying deployment files ====="

$webRoot = "C:\websites\DotNetApp"

if (Test-Path $webRoot) {
    Write-Host "Deployment files copied to: $webRoot"
} else {
    Write-Host "ERROR: Deployment folder missing."
    exit 1
}

Write-Host "===== AfterInstall completed successfully ====="
exit 0
