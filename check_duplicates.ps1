$domains = @(Get-Content gamblingFeed.txt | Where-Object {$_ -ne ''})
$duplicates = $domains | Group-Object | Where-Object {$_.Count -gt 1}

if ($duplicates) {
    Write-Host "=== DUPLICATE DOMAINS ===" -ForegroundColor Red
    $duplicates | ForEach-Object {
        Write-Host "$($_.Name) (appears $($_.Count) times)" -ForegroundColor Yellow
    }
    Write-Host "`nTotal duplicates found: $($duplicates.Count)" -ForegroundColor Cyan
} else {
    Write-Host "No duplicates found!" -ForegroundColor Green
}
