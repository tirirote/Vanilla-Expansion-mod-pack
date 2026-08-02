# dungeons/armor/on_hit.mcfunction
# @s is the player
function vexp:dungeons/armor/detect_type
execute if entity @s[tag=vexp.armor_equip] run function vexp:dungeons/armor/hooks/on_hit with entity @s equipment.chest.components."minecraft:custom_data".vexp
