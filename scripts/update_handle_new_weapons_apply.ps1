param(
    [string]$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$datapackRoot = Join-Path $RepoRoot "datapack"
$recipesDir = Join-Path $datapackRoot "data/minecraft/recipe"
$vexpArmorRecipesDir = Join-Path $datapackRoot "data/vexp/recipe/armor"
$macroDir = Join-Path $datapackRoot "data/vexp/function/dungeons/handle_new_weapons/macro"

if (-not (Test-Path $recipesDir)) {
    throw "Recipe folder not found: $recipesDir"
}
if (-not (Test-Path $vexpArmorRecipesDir)) {
    throw "Armor recipe folder not found: $vexpArmorRecipesDir"
}
if (-not (Test-Path $macroDir)) {
    throw "Macro folder not found: $macroDir"
}

function ConvertTo-Snbt {
    param([Parameter(Mandatory = $true)]$Value)

    if ($null -eq $Value) { return "null" }

    if ($Value -is [bool]) {
        if ($Value) { return "true" }
        return "false"
    }

    if ($Value -is [string]) {
        $escaped = $Value.Replace('\\', '\\\\').Replace('"', '\\"')
        return '"' + $escaped + '"'
    }

    if ($Value -is [byte] -or $Value -is [int16] -or $Value -is [int32] -or $Value -is [int64]) {
        return [string]$Value
    }

    if ($Value -is [single] -or $Value -is [double] -or $Value -is [decimal]) {
        return ([string]::Format([System.Globalization.CultureInfo]::InvariantCulture, "{0}", $Value))
    }

    if ($Value -is [System.Collections.IDictionary]) {
        $parts = New-Object System.Collections.Generic.List[string]
        foreach ($key in $Value.Keys) {
            $parts.Add('"' + [string]$key + '":' + (ConvertTo-Snbt -Value $Value[$key]))
        }
        return "{" + ($parts -join ",") + "}"
    }

    if ($Value -is [System.Collections.IEnumerable] -and -not ($Value -is [string])) {
        $parts = New-Object System.Collections.Generic.List[string]
        foreach ($item in $Value) {
            $parts.Add((ConvertTo-Snbt -Value $item))
        }
        return "[" + ($parts -join ",") + "]"
    }

    if ($Value -is [pscustomobject]) {
        $parts = New-Object System.Collections.Generic.List[string]
        foreach ($prop in $Value.PSObject.Properties) {
            $parts.Add('"' + $prop.Name + '":' + (ConvertTo-Snbt -Value $prop.Value))
        }
        return "{" + ($parts -join ",") + "}"
    }

    return '"' + ([string]$Value).Replace('"', '\\"') + '"'
}

function Get-Recipe {
    param(
        [Parameter(Mandatory = $true)][string]$Type,
        [Parameter(Mandatory = $true)][string]$Material
    )

    $fileName = if ($Type -eq "bow") {
        "bow.json"
    }
    elseif ($Material -eq "netherite") {
        "netherite_${Type}_smithing.json"
    }
    else {
        "${Material}_${Type}.json"
    }

    $path = Join-Path $recipesDir $fileName
    if (-not (Test-Path $path)) {
        throw "Missing recipe file: $path"
    }

    $json = Get-Content $path -Raw | ConvertFrom-Json
    return [pscustomobject]@{
        path = $path
        data = $json
    }
}

function Get-ArmorRecipe {
    param(
        [Parameter(Mandatory = $true)][string]$Type,
        [Parameter(Mandatory = $true)][string]$Material
    )

    if ($Material -ne "chainmail") {
        return Get-Recipe -Type $Type -Material $Material
    }

    $path = Join-Path $vexpArmorRecipesDir "chainmail_${Type}.json"
    if (-not (Test-Path $path)) {
        throw "Missing chainmail armor recipe file: $path"
    }

    return [pscustomobject]@{
        path = $path
        data = Get-Content $path -Raw | ConvertFrom-Json
    }
}

function Get-ComponentValue {
    param(
        [Parameter(Mandatory = $true)]$Components,
        [Parameter(Mandatory = $true)][string]$PrimaryName,
        [string]$FallbackName
    )

    if ($Components.PSObject.Properties.Name -contains $PrimaryName) {
        return $Components.$PrimaryName
    }
    if ($FallbackName -and ($Components.PSObject.Properties.Name -contains $FallbackName)) {
        return $Components.$FallbackName
    }
    return $null
}

function Build-SetComponents {
    param([Parameter(Mandatory = $true)]$RecipeData)

    $components = $RecipeData.result.components
    $set = [ordered]@{}

    if ($null -eq $components) {
        return [pscustomobject]@{
            setComponents         = $set
            hasAttributeModifiers = $false
            hasConsumable         = $false
        }
    }

    if ($components -is [System.Collections.IDictionary]) {
        foreach ($key in $components.Keys) {
            $set[[string]$key] = $components[$key]
        }
    }
    elseif ($components -is [pscustomobject]) {
        foreach ($prop in $components.PSObject.Properties) {
            $set[$prop.Name] = $prop.Value
        }
    }
    else {
        throw "Unsupported recipe components type: $($components.GetType().FullName)"
    }

    return [pscustomobject]@{
        setComponents         = $set
        hasAttributeModifiers = $set.Contains("minecraft:attribute_modifiers")
        hasConsumable         = $set.Contains("minecraft:consumable")
    }
}

function Write-Utf8NoBom {
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][string]$Content
    )

    $enc = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($Path, $Content, $enc)
}

function Build-ApplyLine {
    param(
        [Parameter(Mandatory = $true)][string]$ItemId,
        [Parameter(Mandatory = $true)][hashtable]$SetComponents,
        [string]$ExtraCondition = "",
        [string]$TargetPath = "SelectedItem",
        [string]$ModifySlot = "weapon.mainhand",
        [string]$GuardPath = "SelectedItem"
    )

    $guard = ('execute unless data entity @s {0}.components."minecraft:custom_data".vexp' -f $GuardPath)
    $condition = ('if data entity @s {0}{{id:"{1}"}}' -f $TargetPath, $ItemId)
    if ($ExtraCondition) {
        $condition += " $ExtraCondition"
    }

    $componentsSnbt = ConvertTo-Snbt -Value $SetComponents
    return ('{0} {1} run item modify entity @s {2} {{"function":"minecraft:set_components","components":{3}}}' -f $guard, $condition, $ModifySlot, $componentsSnbt)
}

$materials = @("wooden", "stone", "copper", "iron", "golden", "diamond", "netherite")
$armorMaterials = @("leather", "chainmail", "copper", "iron", "golden", "diamond", "netherite")
$armorPieces = @("helmet", "chestplate", "leggings", "boots")

# bow
$bowRecipe = (Get-Recipe -Type "bow" -Material "wood").data
$bowPack = Build-SetComponents -RecipeData $bowRecipe
$bowLines = New-Object System.Collections.Generic.List[string]
$bowLines.Add("# Apply full recipe components for vanilla bow found without vexp data.")
$bowLines.Add("# Auto-generated by scripts/update_handle_new_weapons_apply.ps1")
$bowLines.Add("# @s is the player.")
$bowLines.Add("")
$bowLines.Add("# minecraft:bow")
$bowLines.Add((Build-ApplyLine -ItemId "minecraft:bow" -SetComponents $bowPack.setComponents))
$bowLines.Add("")
Write-Utf8NoBom -Path (Join-Path $macroDir "apply_bow.mcfunction") -Content (($bowLines -join "`n") + "`n")

# sword
$swordLines = New-Object System.Collections.Generic.List[string]
$swordLines.Add("# Apply full recipe components for vanilla swords found without vexp data.")
$swordLines.Add("# Auto-generated by scripts/update_handle_new_weapons_apply.ps1")
$swordLines.Add("# @s is the player.")
$swordLines.Add("")
foreach ($m in $materials) {
    $recipe = (Get-Recipe -Type "sword" -Material $m).data
    $pack = Build-SetComponents -RecipeData $recipe
    $id = $recipe.result.id
    $modelTag = "vexp:${m}_spear"
    $extra = ('unless data entity @s SelectedItem.components."minecraft:custom_model_data"{{strings:["{0}"]}}' -f $modelTag)
    $swordLines.Add("")
    $swordLines.Add("# $id")
    $swordLines.Add((Build-ApplyLine -ItemId $id -SetComponents $pack.setComponents -ExtraCondition $extra))
}
Write-Utf8NoBom -Path (Join-Path $macroDir "apply_sword.mcfunction") -Content (($swordLines -join "`n") + "`n")

# axe, pickaxe, shovel, hoe
foreach ($type in @("axe", "pickaxe", "shovel", "hoe")) {
    $lines = New-Object System.Collections.Generic.List[string]
    $lines.Add("# Apply full recipe components for vanilla ${type}s found without vexp data.")
    $lines.Add("# Auto-generated by scripts/update_handle_new_weapons_apply.ps1")
    $lines.Add("# @s is the player.")
    $lines.Add("")

    foreach ($m in $materials) {
        $recipe = (Get-Recipe -Type $type -Material $m).data
        $pack = Build-SetComponents -RecipeData $recipe
        $id = $recipe.result.id
        $lines.Add("")
        $lines.Add("# $id")
        $lines.Add((Build-ApplyLine -ItemId $id -SetComponents $pack.setComponents))
    }

    Write-Utf8NoBom -Path (Join-Path $macroDir "apply_${type}.mcfunction") -Content (($lines -join "`n") + "`n")
}

# spear (convert vanilla spear item id to matching sword id + model, then apply)
$spearLines = New-Object System.Collections.Generic.List[string]
$spearLines.Add("# Apply full recipe components for vanilla spears found without vexp data.")
$spearLines.Add("# Auto-generated by scripts/update_handle_new_weapons_apply.ps1")
$spearLines.Add("# Vanilla spears are converted to their sword base with spear custom_model_data,")
$spearLines.Add("# then full spear components are applied.")
$spearLines.Add("# @s is the player.")
$spearLines.Add("")

foreach ($m in $materials) {
    $recipe = (Get-Recipe -Type "spear" -Material $m).data
    $pack = Build-SetComponents -RecipeData $recipe

    $spearId = if ($m -eq "netherite") { "minecraft:netherite_spear" } else { "minecraft:${m}_spear" }
    $swordId = $recipe.result.id
    $modelStrings = $null
    if ($pack.setComponents.Contains("minecraft:custom_model_data")) {
        $modelStrings = $pack.setComponents["minecraft:custom_model_data"].strings
    }
    if ($null -eq $modelStrings -or $modelStrings.Count -lt 1) {
        throw "Recipe missing minecraft:custom_model_data.strings for spear: $m"
    }
    $modelTag = $modelStrings[0]

    $guard = 'execute unless data entity @s SelectedItem.components."minecraft:custom_data".vexp'
    $spearLines.Add(('{0} if data entity @s SelectedItem{{id:"{1}"}} run item replace entity @s weapon.mainhand with {2}[minecraft:custom_model_data={{strings:["{3}"]}}]' -f $guard, $spearId, $swordId, $modelTag))

    $extra = ('if data entity @s SelectedItem{{id:"{0}",components:{{"minecraft:custom_model_data":{{strings:["{1}"]}}}}}}' -f $swordId, $modelTag)
    $componentsSnbt = ConvertTo-Snbt -Value $pack.setComponents
    $spearLines.Add(('{0} {1} run item replace entity @s weapon.mainhand from entity @s weapon.mainhand {{"function":"minecraft:set_components","components":{2}}}' -f $guard, $extra, $componentsSnbt))
    $spearLines.Add("")
}

Write-Utf8NoBom -Path (Join-Path $macroDir "apply_spear.mcfunction") -Content (($spearLines -join "`n") + "`n")

# armor (selected in hand + equipped in the matching armor slot)
$armorLines = New-Object System.Collections.Generic.List[string]
$armorLines.Add("# Apply full recipe components for vanilla armor found without vexp data.")
$armorLines.Add("# Auto-generated by scripts/update_handle_new_weapons_apply.ps1")
$armorLines.Add("# @s is the player.")
$armorLines.Add("")

foreach ($m in $armorMaterials) {
    foreach ($piece in $armorPieces) {
        $recipe = (Get-ArmorRecipe -Type $piece -Material $m).data
        $pack = Build-SetComponents -RecipeData $recipe
        $id = $recipe.result.id

        $target = switch ($piece) {
            "helmet" { @{ Path = "equipment.head"; Slot = "armor.head" } }
            "chestplate" { @{ Path = "equipment.chest"; Slot = "armor.chest" } }
            "leggings" { @{ Path = "equipment.legs"; Slot = "armor.legs" } }
            "boots" { @{ Path = "equipment.feet"; Slot = "armor.feet" } }
            default { throw "Unsupported armor piece: $piece" }
        }

        $armorLines.Add("")
        $armorLines.Add("# $id")
        $armorLines.Add((Build-ApplyLine -ItemId $id -SetComponents $pack.setComponents -TargetPath "SelectedItem" -ModifySlot "weapon.mainhand" -GuardPath "SelectedItem"))
        $armorLines.Add((Build-ApplyLine -ItemId $id -SetComponents $pack.setComponents -TargetPath $target.Path -ModifySlot $target.Slot -GuardPath $target.Path))
    }
}

Write-Utf8NoBom -Path (Join-Path $macroDir "apply_armor.mcfunction") -Content (($armorLines -join "`n") + "`n")

Write-Host "Updated apply macros in: $macroDir"
