# dungeons/armor/detect_type.mcfunction
# @s is the player
# Output in storage vexp:dungeons.armor armor_params with quality and per-slot stats

data modify storage vexp:dungeons.armor armor_params set value {quality:"none",stats:{head:{defense:0,toughness:0,knockback_resistance:0.0f},chest:{defense:0,toughness:0,knockback_resistance:0.0f},legs:{defense:0,toughness:0,knockback_resistance:0.0f},feet:{defense:0,toughness:0,knockback_resistance:0.0f}}}

execute if items entity @s armor.head *[custom_data~{vexp:{item:"armor"}}] run data modify storage vexp:dungeons.armor armor_params.quality set from entity @s equipment.head.components."minecraft:custom_data".vexp.quality
execute if items entity @s armor.head *[custom_data~{vexp:{item:"armor",armor:{stats:{}}}}] run data modify storage vexp:dungeons.armor armor_params.stats.head set from entity @s equipment.head.components."minecraft:custom_data".vexp.armor.stats
execute if items entity @s armor.chest *[custom_data~{vexp:{item:"armor",armor:{stats:{}}}}] run data modify storage vexp:dungeons.armor armor_params.stats.chest set from entity @s equipment.chest.components."minecraft:custom_data".vexp.armor.stats
execute if items entity @s armor.legs *[custom_data~{vexp:{item:"armor",armor:{stats:{}}}}] run data modify storage vexp:dungeons.armor armor_params.stats.legs set from entity @s equipment.legs.components."minecraft:custom_data".vexp.armor.stats
execute if items entity @s armor.feet *[custom_data~{vexp:{item:"armor",armor:{stats:{}}}}] run data modify storage vexp:dungeons.armor armor_params.stats.feet set from entity @s equipment.feet.components."minecraft:custom_data".vexp.armor.stats
