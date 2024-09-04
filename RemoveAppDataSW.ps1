$Apps_paths = @(
#Google Chrome
"AppData\Local\Google\Chrome\Application",
"AppData\Local\Google\Update",
#Firefox
"AppData\Local\Mozilla Firefox",
#Opera
"AppData\Local\Programs\Opera",
#Zoom
"AppData\Roaming\Zoom",
#Telegram
"AppData\Roaming\Telegram Desktop"
#Microsoft OneDrive
"AppData\Local\Microsoft\OneDrive"
#Microsoft Teams Classic
"AppData\Local\Microsoft\Teams"
#Yandex Browser
"AppData\Local\Yandex\YandexBrowser\Application"
"AppData\Local\Yandex\YandexBrowser\Updates"
)

Get-ChildItem "C:\Users" -Directory -Exclude Default,Public | ForEach-Object {
    Foreach ($path in $Apps_paths) {
    $joined_path = Join-Path -Path $_.FullName -ChildPath $path
    if (Test-Path $joined_path) {
        Write-Host "Removing" $joined_path
        Remove-Item $joined_path -Recurse -Force
    }
  }
}
