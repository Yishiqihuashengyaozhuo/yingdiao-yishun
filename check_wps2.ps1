Write-Host "Checking WPS directories..."

$paths = @(
    "C:\Program Files\Kingsoft\"
    "C:\Program Files (x86)\Kingsoft\"
    "C:\Users\Administrator\AppData\Local\Kingsoft\"
)

foreach ($p in $paths) {
    if (Test-Path $p) {
        Write-Host "Found: $p"
        Get-ChildItem $p -Recurse -Depth 2 -ErrorAction SilentlyContinue | Select-Object -ExpandProperty FullName
    } else {
        Write-Host "Not found: $p"
    }
}

Write-Host "`nChecking registry..."
try {
    $reg = Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\wps.exe" -ErrorAction Stop
    Write-Host "Found wps.exe in registry (64-bit)"
    Write-Host $reg.'(Default)'
} catch {
    Write-Host "Not in 64-bit registry"
}

try {
    $reg = Get-ItemProperty "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\App Paths\wps.exe" -ErrorAction Stop
    Write-Host "Found wps.exe in registry (32-bit)"
    Write-Host $reg.'(Default)'
} catch {
    Write-Host "Not in 32-bit registry"
}

Write-Host "`nChecking Program Files for WPS..."
Get-ChildItem "C:\Program Files\" -Directory -Filter "*WPS*" -ErrorAction SilentlyContinue | ForEach-Object { Write-Host $_.FullName }
Get-ChildItem "C:\Program Files (x86)\" -Directory -Filter "*WPS*" -ErrorAction SilentlyContinue | ForEach-Object { Write-Host $_.FullName }
Get-ChildItem "C:\Program Files\" -Directory -Filter "*Kingsoft*" -ErrorAction SilentlyContinue | ForEach-Object { Write-Host $_.FullName }
Get-ChildItem "C:\Program Files (x86)\" -Directory -Filter "*Kingsoft*" -ErrorAction SilentlyContinue | ForEach-Object { Write-Host $_.FullName }
