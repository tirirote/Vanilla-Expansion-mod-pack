# dungeons/armor/process_player.mcfunction
# @s is the player
execute if items entity @s armor.* #trimmable_armor run function vexp:dungeons/armor/detect_type
execute if entity @s[tag=vexp.armor_equip] at @s run function vexp:dungeons/armor/hooks/tick with entity @s equipment.chest.components."minecraft:custom_data".vexp
execute if entity @s[tag=vexp.armor_equip] if predicate vexp:is_sprinting at @s run function vexp:dungeons/armor/hooks/on_sprint with entity @s equipment.chest.components."minecraft:custom_data".vexp
execute if entity @s[tag=vexp.armor_equip] if predicate vexp:is_sneaking at @s run function vexp:dungeons/armor/hooks/on_sneaking with entity @s equipment.chest.components."minecraft:custom_data".vexp
