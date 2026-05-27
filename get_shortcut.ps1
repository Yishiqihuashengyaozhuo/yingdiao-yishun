$WScript = New-Object -ComObject WScript.Shell
$shortcut = $WScript.CreateShortcut("C:\Users\Administrator\Desktop\WPS.lnk")
Write-Host "Target: $($shortcut.TargetPath)"
Write-Host "Arguments: $($shortcut.Arguments)"
Write-Host "WorkingDir: $($shortcut.WorkingDirectory)"
