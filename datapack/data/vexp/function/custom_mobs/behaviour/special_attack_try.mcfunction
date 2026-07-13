# 1. Mob waiting for attack
$execute if entity @e[tag=vexp.mob_target,tag=!vexp.mob_player_with_fav_item,distance=..$(special_range)] run function vexp:custom_mobs/mobs/$(type)/on_special_attack_waiting

# 2. Try to find player
$execute unless entity @s[tag=vexp.mob_special_ready] positioned ^ ^ ^$(special_range) if entity @e[tag=vexp.mob_target,tag=!vexp.mob_player_with_fav_item,distance=..4.5] run tag @s add vexp.mob_special_ready
$execute unless entity @s[tag=vexp.mob_special_ready] positioned ^ ^ ^$(special_range_step1) if entity @e[tag=vexp.mob_target,tag=!vexp.mob_player_with_fav_item,distance=..4.5] run tag @s add vexp.mob_special_ready
$execute unless entity @s[tag=vexp.mob_special_ready] positioned ^ ^ ^$(special_range_step2) if entity @e[tag=vexp.mob_target,tag=!vexp.mob_player_with_fav_item,distance=..4.5] run tag @s add vexp.mob_special_ready
$execute unless entity @s[tag=vexp.mob_special_ready] positioned ^ ^ ^$(special_range_step3) if entity @e[tag=vexp.mob_target,tag=!vexp.mob_player_with_fav_item,distance=..4.5] run tag @s add vexp.mob_special_ready
$execute unless entity @s[tag=vexp.mob_special_ready] positioned ^ ^ ^$(special_range_step4) if entity @e[tag=vexp.mob_target,tag=!vexp.mob_player_with_fav_item,distance=..4.5] run tag @s add vexp.mob_special_ready

# 3. Try to do special when player found
execute if entity @s[tag=vexp.mob_special_ready] run function vexp:custom_mobs/behaviour/special_attack_ready_wrapper with entity @s data.vexp.mob

# 4. Remove tag so the mob can retry the search
tag @s remove vexp.mob_special_ready
tag @s remove vexp.mob_aggro
