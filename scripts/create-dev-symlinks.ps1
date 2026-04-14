param(
    [string]$DatapacksPath = "C:\Users\Usuario\AppData\Roaming\.minecraft\saves\Datapack Developing\datapacks",
    [string]$ResourcepacksPath = "$env:APPDATA\.minecraft\resourcepacks",
    [string]$DatapackLinkName = "vanilla-expansion-datapack",
    [string]$ResourcepackLinkName = "vanilla-expansion-resourcepack",
    [switch]$Force
)

$repoRoot = Split-Path -Parent $PSScriptRoot
$datapackSource = Join-Path $repoRoot "datapack"
$resourcepackSource = Join-Path $repoRoot "resourcepack"

function Ensure-DirectorySymlink {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Source,
        [Parameter(Mandatory = $true)]
        [string]$Destination,
        [switch]$Force
    )

    if (-not (Test-Path -LiteralPath $Source -PathType Container)) {
        throw "Source folder not found: $Source"
    }

    $destinationParent = Split-Path -Parent $Destination
    if (-not (Test-Path -LiteralPath $destinationParent -PathType Container)) {
        New-Item -ItemType Directory -Path $destinationParent -Force | Out-Null
        Write-Output "created parent: $destinationParent"
    }

    if (Test-Path -LiteralPath $Destination) {
        $existingItem = Get-Item -LiteralPath $Destination -Force
        $isReparsePoint = ($existingItem.Attributes -band [System.IO.FileAttributes]::ReparsePoint) -ne 0

        if ($isReparsePoint) {
            # If an existing symlink already points to the same source, keep it.
            $currentTarget = $null
            if ($existingItem.PSObject.Properties.Name -contains "Target") {
                $currentTarget = $existingItem.Target
            }

            if ($currentTarget) {
                $resolvedSource = (Resolve-Path -LiteralPath $Source).Path
                $resolvedTarget = $currentTarget

                if (Test-Path -LiteralPath $currentTarget) {
                    $resolvedTarget = (Resolve-Path -LiteralPath $currentTarget).Path
                }

                if ($resolvedSource -ieq $resolvedTarget) {
                    Write-Output "already linked: $Destination -> $resolvedSource"
                    return
                }
            }

            Remove-Item -LiteralPath $Destination -Force
            Write-Output "replaced existing link: $Destination"
        }
        elseif ($Force) {
            Remove-Item -LiteralPath $Destination -Recurse -Force
            Write-Output "removed existing folder/file (-Force): $Destination"
        }
        else {
            throw "Destination exists and is not a symlink: $Destination. Use -Force to replace it."
        }
    }

    New-Item -ItemType SymbolicLink -Path $Destination -Target $Source | Out-Null
    Write-Output "linked: $Destination -> $Source"
}

$datapackDestination = Join-Path $DatapacksPath $DatapackLinkName
$resourcepackDestination = Join-Path $ResourcepacksPath $ResourcepackLinkName

try {
    Ensure-DirectorySymlink -Source $datapackSource -Destination $datapackDestination -Force:$Force
    Ensure-DirectorySymlink -Source $resourcepackSource -Destination $resourcepackDestination -Force:$Force

    Write-Output "done"
    Write-Output "datapack: $datapackDestination"
    Write-Output "resourcepack: $resourcepackDestination"
}
catch {
    Write-Error $_.Exception.Message
    Write-Output "Tip: run PowerShell as Administrator or enable Developer Mode in Windows if symlink creation fails."
    exit 1
}
