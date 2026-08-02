# dungeons/armor/detect_type.mcfunction
# @s is the player
# Output in storage vexp:dungeons.armor armor_params with quality and per-slot stats

# Tag player
execute unless entity @s[tag=vexp.armor_equip] if items entity @s armor.head *[custom_data~{vexp:{item:"armor"}}] run tag @s add vexp.armor_equip
execute unless entity @s[tag=vexp.armor_equip] if items entity @s armor.chest *[custom_data~{vexp:{item:"armor"}}] run tag @s add vexp.armor_equip
execute unless entity @s[tag=vexp.armor_equip] if items entity @s armor.legs *[custom_data~{vexp:{item:"armor"}}] run tag @s add vexp.armor_equip
execute unless entity @s[tag=vexp.armor_equip] if items entity @s armor.feet *[custom_data~{vexp:{item:"armor"}}] run tag @s add vexp.armor_equip

execute if entity @s[tag=vexp.armor_equip] unless items entity @s armor.head *[custom_data~{vexp:{item:"armor"}}] run tag @s remove vexp.armor_equip
execute if entity @s[tag=vexp.armor_equip] unless items entity @s armor.chest *[custom_data~{vexp:{item:"armor"}}] run tag @s remove vexp.armor_equip
execute if entity @s[tag=vexp.armor_equip] unless items entity @s armor.legs *[custom_data~{vexp:{item:"armor"}}] run tag @s remove vexp.armor_equip
execute if entity @s[tag=vexp.armor_equip] unless items entity @s armor.feet *[custom_data~{vexp:{item:"armor"}}] run tag @s remove vexp.armor_equip
