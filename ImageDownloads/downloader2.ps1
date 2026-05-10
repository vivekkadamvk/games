# Setup
$csv = Import-Csv .\games.csv
$apiKey = "658c3edc3f0541ac69b52b02f6528489"
$outputCsv = ".\Final_Game_Links.csv"

# Create the new CSV with headers
"GameName,NewLink" | Out-File $outputCsv -Encoding utf8

foreach ($row in $csv) {
    $url = $row.Link
    $gameName = $row.GameName

    # Skip empty rows
    if ([string]::IsNullOrWhiteSpace($url)) { continue }

    Write-Host "Processing: $gameName..."

    # Define a temporary file name
    $tempFile = ".\temp_image.jpg"

    try {
        # 1. Download the image locally (bypassing hotlink protection)
        Invoke-WebRequest -Uri $url -Headers @{ "Referer"="https://dlpsgame.com/" } -OutFile $tempFile

        # 2. Convert to Base64 for the API upload
        $base64 = [Convert]::ToBase64String([IO.File]::ReadAllBytes($tempFile))
        $body = @{
            key = $apiKey
            image = $base64
        }

        # 3. POST the image to ImgBB
        $response = Invoke-RestMethod -Uri "https://api.imgbb.com/1/upload" -Method Post -Body $body

        # 4. Extract the new direct link from the JSON response
        $newUrl = $response.data.url

        # 5. Save the Game Name and New Link to the final CSV
        # Wrapping in quotes ensures commas in game names don't break the CSV format
        "`"$gameName`",`"$newUrl`"" | Out-File -Append $outputCsv -Encoding utf8

        Write-Host " -> Success: $newUrl" -ForegroundColor Cyan

    } catch {
        Write-Host " -> Failed to process $gameName" -ForegroundColor Red
    } finally {
        # 6. Delete the temporary file to save storage space
        if (Test-Path $tempFile) { Remove-Item $tempFile }
    }
}

Write-Host "Pipeline complete! Open Final_Game_Links.csv to see your matched list." -ForegroundColor Green