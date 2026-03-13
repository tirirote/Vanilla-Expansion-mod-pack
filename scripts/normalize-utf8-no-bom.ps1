$root = Split-Path -Parent $PSScriptRoot
$patterns = @('*.mcfunction', '*.json', '*.jsonc', '*.mcmeta')
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

Get-ChildItem -Path $root -Recurse -File | Where-Object {
    $name = $_.Name
    foreach ($pattern in $patterns) {
        if ($name -like $pattern) { return $true }
    }
    return $false
} | ForEach-Object {
    $content = [System.IO.File]::ReadAllText($_.FullName)
    [System.IO.File]::WriteAllText($_.FullName, $content, $utf8NoBom)
    Write-Output "normalized: $($_.FullName)"
}
