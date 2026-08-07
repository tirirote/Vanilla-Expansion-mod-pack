# Return success when any equipped armor slot still lacks vexp data.
# @s is the player

execute if items entity @s armor.head #head_armor unless items entity @s armor.head *[minecraft:custom_data] unless data entity @s equipment.head.components."minecraft:custom_data" run function vexp:dungeons/handle_new_weapons/macro/apply_armor
execute if items entity @s armor.chest #chest_armor unless items entity @s armor.chest *[minecraft:custom_data] unless data entity @s equipment.chest.components."minecraft:custom_data" run function vexp:dungeons/handle_new_weapons/macro/apply_armor
execute if items entity @s armor.legs #leg_armor unless items entity @s armor.legs *[minecraft:custom_data] unless data entity @s equipment.legs.components."minecraft:custom_data" run function vexp:dungeons/handle_new_weapons/macro/apply_armor
execute if items entity @s armor.feet #foot_armor unless items entity @s armor.feet *[minecraft:custom_data] unless data entity @s equipment.feet.components."minecraft:custom_data" run function vexp:dungeons/handle_new_weapons/macro/apply_armor
