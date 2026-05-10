$urls = Get-Content .\urls.txt
foreach ($url in $urls) {
    if (-not [string]::IsNullOrWhiteSpace($url)) {
        $filename = Split-Path $url -Leaf
        Write-Host "Downloading $filename..."
        Invoke-WebRequest -Uri $url -Headers @{ "Referer"="https://dlpsgame.com/" } -OutFile ".\$filename"
    }
}
Write-Host "Done!" -ForegroundColor Green