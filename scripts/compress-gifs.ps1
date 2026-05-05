param(
    [string]$InputPath = (Join-Path (Split-Path -Parent $PSScriptRoot) "docs\gifs"),
    [int]$Lossy = 80,
    [int]$Colors = 128,
    [ValidateRange(1, 100)]
    [int]$Scale = 50,
    [switch]$Recurse
)

$ErrorActionPreference = "Stop"

function Get-WinGetExecutablePath {
    param(
        [Parameter(Mandatory = $true)]
        [string]$ExecutableName
    )

    $linksPath = Join-Path $env:LOCALAPPDATA "Microsoft\WinGet\Links"
    $linkedExecutable = Join-Path $linksPath $ExecutableName
    if (Test-Path -LiteralPath $linkedExecutable) {
        return $linkedExecutable
    }

    $packagesPath = Join-Path $env:LOCALAPPDATA "Microsoft\WinGet\Packages"
    if (-not (Test-Path -LiteralPath $packagesPath -PathType Container)) {
        return $null
    }

    $match = Get-ChildItem -Path $packagesPath -Filter $ExecutableName -Recurse -File -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($match) {
        return $match.FullName
    }

    return $null
}

function Get-AvailableGifTool {
    foreach ($name in @("gifsicle", "ffmpeg", "magick")) {
        $command = Get-Command $name -ErrorAction SilentlyContinue
        if ($command) {
            return [PSCustomObject]@{
                Name    = $name
                Command = $command.Source
            }
        }

        $wingetCommand = Get-WinGetExecutablePath -ExecutableName "$name.exe"
        if ($wingetCommand) {
            return [PSCustomObject]@{
                Name    = $name
                Command = $wingetCommand
            }
        }
    }

    return $null
}


function Compress-WithGifsicle {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Command,
        [Parameter(Mandatory = $true)]
        [string]$InputFile,
        [Parameter(Mandatory = $true)]
        [string]$OutputFile,
        [Parameter(Mandatory = $true)]
        [int]$Lossy,
        [Parameter(Mandatory = $true)]
        [int]$Colors,
        [Parameter(Mandatory = $true)]
        [int]$Scale
    )

    $arguments = @(
        "--optimize=3",
        "--lossy=$Lossy",
        "--colors", "$Colors",
        "--scale", "$($Scale / 100.0)",
        "--output", $OutputFile,
        $InputFile
    )

    & $Command @arguments
    if ($LASTEXITCODE -ne 0) {
        throw "gifsicle failed for $InputFile"
    }
}

function Compress-WithFfmpeg {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Command,
        [Parameter(Mandatory = $true)]
        [string]$InputFile,
        [Parameter(Mandatory = $true)]
        [int]$Colors,
        [Parameter(Mandatory = $true)]
        [int]$Scale
    )

    $dir = [System.IO.Path]::GetDirectoryName($InputFile)
    $stem = [System.IO.Path]::GetFileNameWithoutExtension($InputFile)
    $paletteFile = Join-Path $dir "${stem}.palette.png"
    $tempFile = Join-Path $dir "${stem}.tmp.gif"
    # scale filter: iw*Scale/100 rounded down to nearest even number
    $scaleFilter = "scale=trunc(iw*${Scale}/100/2)*2:trunc(ih*${Scale}/100/2)*2:flags=lanczos"
    try {
        & $Command -y -loglevel warning -i $InputFile -vf "${scaleFilter},palettegen=max_colors=${Colors}:stats_mode=diff" -update 1 $paletteFile
        if ($LASTEXITCODE -ne 0) {
            throw "ffmpeg palette generation failed for $InputFile"
        }

        & $Command -y -loglevel warning -i $InputFile -i $paletteFile -lavfi "[0:v]${scaleFilter}[scaled];[scaled][1:v]paletteuse=dither=bayer:bayer_scale=3:diff_mode=rectangle" $tempFile
        if ($LASTEXITCODE -ne 0) {
            throw "ffmpeg compression failed for $InputFile"
        }

        Move-Item -LiteralPath $tempFile -Destination $InputFile -Force
    }
    finally {
        if (Test-Path -LiteralPath $paletteFile) { Remove-Item -LiteralPath $paletteFile -Force }
        if (Test-Path -LiteralPath $tempFile) { Remove-Item -LiteralPath $tempFile -Force }
    }
}

function Compress-WithMagick {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Command,
        [Parameter(Mandatory = $true)]
        [string]$InputFile,
        [Parameter(Mandatory = $true)]
        [int]$Colors,
        [Parameter(Mandatory = $true)]
        [int]$Scale
    )

    $dir = [System.IO.Path]::GetDirectoryName($InputFile)
    $stem = [System.IO.Path]::GetFileNameWithoutExtension($InputFile)
    $tempFile = Join-Path $dir "${stem}.tmp.gif"
    try {
        & $Command $InputFile -coalesce -layers Optimize -resize "${Scale}%" -colors $Colors $tempFile
        if ($LASTEXITCODE -ne 0) {
            throw "magick failed for $InputFile"
        }
        Move-Item -LiteralPath $tempFile -Destination $InputFile -Force
    }
    finally {
        if (Test-Path -LiteralPath $tempFile) { Remove-Item -LiteralPath $tempFile -Force }
    }
}

if (-not (Test-Path -LiteralPath $InputPath -PathType Container)) {
    throw "Input folder not found: $InputPath"
}

$tool = Get-AvailableGifTool
if (-not $tool) {
    throw "No GIF compression tool found. Install gifsicle, ffmpeg, or ImageMagick (magick) and run the script again."
}

$searchOption = if ($Recurse) { "AllDirectories" } else { "TopDirectoryOnly" }
$gifFiles = [System.IO.Directory]::GetFiles($InputPath, "*.gif", $searchOption) | Sort-Object

if ($gifFiles.Count -eq 0) {
    Write-Output "No GIF files found in $InputPath"
    exit 0
}

Write-Output "Using tool: $($tool.Name)"
Write-Output "Input: $InputPath (overwrite, scale ${Scale}%)"

foreach ($gifFile in $gifFiles) {
    $inputItem = Get-Item -LiteralPath $gifFile
    $originalBytes = $inputItem.Length

    switch ($tool.Name) {
        "gifsicle" {
            Compress-WithGifsicle -Command $tool.Command -InputFile $gifFile -OutputFile $gifFile -Lossy $Lossy -Colors $Colors -Scale $Scale
        }
        "ffmpeg" {
            Compress-WithFfmpeg -Command $tool.Command -InputFile $gifFile -Colors $Colors -Scale $Scale
        }
        "magick" {
            Compress-WithMagick -Command $tool.Command -InputFile $gifFile -Colors $Colors -Scale $Scale
        }
        default {
            throw "Unsupported tool: $($tool.Name)"
        }
    }

    $compressedBytes = (Get-Item -LiteralPath $gifFile).Length
    $savedBytes = $originalBytes - $compressedBytes
    $savedPercent = if ($originalBytes -gt 0) {
        [Math]::Round(($savedBytes / $originalBytes) * 100, 2)
    }
    else {
        0
    }

    Write-Output ("compressed: {0} | {1:N0} -> {2:N0} bytes | saved {3:N0} bytes ({4}%)" -f $inputItem.Name, $originalBytes, $compressedBytes, $savedBytes, $savedPercent)
}
