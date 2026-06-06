param(
    [string]$Root = ".",
    [switch]$Apply
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Set-Location $Root

$Utf8NoBom = New-Object System.Text.UTF8Encoding($false, $true)

function Read-Utf8Text {
    param([string]$Path)

    return [System.IO.File]::ReadAllText($Path, $Utf8NoBom)
}

function Write-Utf8Text {
    param(
        [string]$Path,
        [string]$Content
    )

    [System.IO.File]::WriteAllText($Path, $Content, $Utf8NoBom)
}

function Get-NormalizedMaterial {
    param(
        [string]$Material,
        [string]$ResultId
    )

    if ($Material) {
        switch ($Material) {
            "wooden" { return "wood" }
            "golden" { return "gold" }
            default { return $Material }
        }
    }

    if (-not $ResultId) { return $null }
    $id = ($ResultId -split ":")[-1]
    if ($id -match "^(wooden|stone|copper|iron|golden|diamond|netherite)_") {
        $m = $Matches[1]
        if ($m -eq "wooden") { return "wood" }
        if ($m -eq "golden") { return "gold" }
        return $m
    }

    return $null
}

function Get-TagFromRecipe {
    param(
        [string]$Quality,
        [string]$Material
    )

    switch ($Quality) {
        "echo" { return "echo" }
        "glowing" { return "glowing" }
        "netherite" { return "netherite" }
        "diamond" { return "diamond" }
        "gold" { return "gold" }
        default {
            if ($Material) { return $Material }
            return $null
        }
    }
}

function Format-Num {
    param([double]$Value)
    $s = [math]::Round($Value, 3).ToString("0.###", [System.Globalization.CultureInfo]::InvariantCulture)
    if ($s -eq "-0") { return "0" }
    return $s
}

function Set-NumericField {
    param(
        [string]$Line,
        [string]$Field,
        [double]$Value
    )

    $num = Format-Num $Value
    $pattern = "(?<prefix>\b$([regex]::Escape($Field)):\s*)(?<val>-?\d+(?:\.\d+)?)"
    return [regex]::Replace($Line, $pattern, ('${prefix}' + $num), 1)
}

function Set-StringField {
    param(
        [string]$Line,
        [string]$Field,
        [string]$Value
    )

    $pattern = '(?<prefix>\b' + [regex]::Escape($Field) + ':\s*)"(?<val>[^"]*)"'
    return [regex]::Replace($Line, $pattern, ('${prefix}"' + $Value + '"'), 1)
}

$recipeFiles = @()
$recipeFiles += Get-ChildItem "datapack/data/minecraft/recipe" -Recurse -Filter "*.json" -File
$recipeFiles += Get-ChildItem "datapack/data/vexp/recipe" -Recurse -Filter "*.json" -File

$recipeMap = @{}
$recipeCount = 0
$recipeAttackSpeedUpdates = 0

foreach ($file in $recipeFiles) {
    $jsonText = Read-Utf8Text -Path $file.FullName
    try {
        $json = $jsonText | ConvertFrom-Json
    }
    catch {
        continue
    }

    if (-not $json.result -or -not $json.result.components) { continue }

    $components = $json.result.components
    if (-not ($components.PSObject.Properties.Name -contains "minecraft:custom_data")) { continue }

    $vexp = $components."minecraft:custom_data".vexp
    if (-not $vexp) { continue }
    if (-not ($vexp.PSObject.Properties.Name -contains "item")) { continue }
    if (-not ($vexp.PSObject.Properties.Name -contains "combo")) { continue }
    if (-not ($vexp.combo.PSObject.Properties.Name -contains "cooldown")) { continue }

    $item = [string]$vexp.item
    $cooldown = [double]$vexp.combo.cooldown
    if ($cooldown -le 0) { continue }

    $attackSpeed = (20.0 / $cooldown) - 4.0

    if ($components.PSObject.Properties.Name -contains "minecraft:attribute_modifiers") {
        foreach ($modifier in $components."minecraft:attribute_modifiers") {
            if ($modifier.type -eq "minecraft:attack_speed") {
                $current = [double]$modifier.amount
                if ([math]::Abs($current - $attackSpeed) -gt 0.0005) {
                    $modifier.amount = [math]::Round($attackSpeed, 3)
                    $recipeAttackSpeedUpdates++
                }
                break
            }
        }
    }

    if ($Apply) {
        $updatedJson = $json | ConvertTo-Json -Depth 100
        Write-Utf8Text -Path $file.FullName -Content ($updatedJson + "`n")
    }

    $materialRaw = $null
    if ($vexp.PSObject.Properties.Name -contains "material") {
        $materialRaw = [string]$vexp.material
    }

    $quality = ""
    if ($vexp.combo.PSObject.Properties.Name -contains "quality") {
        $quality = [string]$vexp.combo.quality
    }

    $material = Get-NormalizedMaterial -Material $materialRaw -ResultId ([string]$json.result.id)
    $tag = Get-TagFromRecipe -Quality $quality -Material $material
    if (-not $tag) { continue }

    $priority = 1
    if ($file.FullName -like "*\datapack\data\vexp\recipe\*") { $priority = 2 }

    $maxDamage = $null
    if ($components.PSObject.Properties.Name -contains "minecraft:max_damage") {
        $maxDamage = [double]$components."minecraft:max_damage"
    }

    $entry = [pscustomobject]@{
        Priority           = $priority
        Source             = $file.FullName
        Item               = $item
        Tag                = $tag
        ResultId           = ([string]$json.result.id -split ":")[-1]
        Quality            = $quality
        ComboDamage        = [double]$vexp.combo.damage
        ComboCooldown      = [double]$vexp.combo.cooldown
        RightClickCooldown = if ($vexp.combo.PSObject.Properties.Name -contains "right_click_cooldown") { [double]$vexp.combo.right_click_cooldown } else { [double]$vexp.combo.cooldown }
        ComboRange         = [double]$vexp.combo.range
        ComboReach         = [double]$vexp.combo.reach
        AttackSpeed        = [math]::Round($attackSpeed, 3)
        MaxDamage          = $maxDamage
    }

    $key = "$item|$tag"
    if (-not $recipeMap.ContainsKey($key) -or $recipeMap[$key].Priority -lt $priority) {
        $recipeMap[$key] = $entry
    }

    $recipeCount++
}

$giveFiles = @{
    "axe"       = "datapack/data/vexp/function/dungeons/weapons/axe/give.mcfunction"
    "bow"       = "datapack/data/vexp/function/dungeons/weapons/bow/give.mcfunction"
    "dagger"    = "datapack/data/vexp/function/dungeons/weapons/dagger/give.mcfunction"
    "gauntlets" = "datapack/data/vexp/function/dungeons/weapons/gauntlets/give.mcfunction"
    "rapier"    = "datapack/data/vexp/function/dungeons/weapons/rapier/give.mcfunction"
    "scythe"    = "datapack/data/vexp/function/dungeons/weapons/scythe/give.mcfunction"
    "spear"     = "datapack/data/vexp/function/dungeons/weapons/spear/give.mcfunction"
    "sword"     = "datapack/data/vexp/function/dungeons/weapons/sword/give.mcfunction"
}

$giveUpdates = 0

foreach ($item in $giveFiles.Keys) {
    $path = $giveFiles[$item]
    if (-not (Test-Path $path)) { continue }

    $lines = (Read-Utf8Text -Path $path) -split "`r?`n"
    if ($lines.Count -gt 0 -and $lines[-1] -eq "") {
        $lines = $lines[0..($lines.Count - 2)]
    }
    $changed = $false

    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]
        if ($line -notmatch "^execute if entity @s\[tag=vexp\.(?<tag>[a-z_]+)\] run data modify storage vexp:dungeons.weapon params merge value \{") {
            continue
        }

        $tag = $Matches["tag"]
        $key = "$item|$tag"
        if (-not $recipeMap.ContainsKey($key)) { continue }

        $recipe = $recipeMap[$key]
        $newLine = $line

        $newLine = Set-NumericField -Line $newLine -Field "spd" -Value $recipe.AttackSpeed
        $newLine = Set-NumericField -Line $newLine -Field "combo_dmg" -Value $recipe.ComboDamage
        $newLine = Set-NumericField -Line $newLine -Field "combo_cooldown" -Value $recipe.ComboCooldown
        $newLine = Set-NumericField -Line $newLine -Field "right_click_cooldown" -Value $recipe.RightClickCooldown
        $newLine = Set-NumericField -Line $newLine -Field "combo_range" -Value $recipe.ComboRange
        $newLine = Set-NumericField -Line $newLine -Field "combo_reach" -Value $recipe.ComboReach
        if ($null -ne $recipe.MaxDamage) {
            $newLine = Set-NumericField -Line $newLine -Field "max_damage" -Value $recipe.MaxDamage
        }
        $newLine = Set-StringField -Line $newLine -Field "item_id" -Value $recipe.ResultId

        if ($newLine -ne $line) {
            $lines[$i] = $newLine
            $changed = $true
            $giveUpdates++
        }
    }

    if ($changed -and $Apply) {
        Write-Utf8Text -Path (Resolve-Path $path) -Content (($lines -join "`n") + "`n")
    }
}

$mode = if ($Apply) { "APPLY" } else { "DRY-RUN" }
Write-Output "[$mode] Recipes scanned: $recipeCount"
Write-Output "[$mode] Recipe attack_speed updates: $recipeAttackSpeedUpdates"
Write-Output "[$mode] Give line updates: $giveUpdates"
Write-Output "[$mode] Recipe keys available for sync: $($recipeMap.Count)"
