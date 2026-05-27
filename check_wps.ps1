$progIDs = @('KET.Application', 'WPP.Application', 'ET.Application', 'WPS.Application')

foreach ($progID in $progIDs) {
    try {
        $test = New-Object -ComObject $progID
        Write-Host "Found: $progID"
        try { $test.Quit() } catch {}
        [System.Runtime.InteropServices.Marshal]::ReleaseComObject($test) | Out-Null
    } catch {
        Write-Host "Not found: $progID"
    }
}
