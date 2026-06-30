# 1. Try to find player
$execute unless entity @s[tag=vexp.mob_special_ready] positioned ^ ^ ^$(special_range) if entity @p[limit=1,distance=..2.5] run tag @s add vexp.mob_special_ready
$execute unless entity @s[tag=vexp.mob_special_ready] positioned ^ ^ ^$(special_range_step1) if entity @p[limit=1,distance=..2.5] run tag @s add vexp.mob_special_ready
$execute unless entity @s[tag=vexp.mob_special_ready] positioned ^ ^ ^$(special_range_step2) if entity @p[limit=1,distance=..2.5] run tag @s add vexp.mob_special_ready
$execute unless entity @s[tag=vexp.mob_special_ready] positioned ^ ^ ^$(special_range_step3) if entity @p[limit=1,distance=..2.5] run tag @s add vexp.mob_special_ready
$execute unless entity @s[tag=vexp.mob_special_ready] positioned ^ ^ ^$(special_range_step4) if entity @p[limit=1,distance=..2.5] run tag @s add vexp.mob_special_ready

# 2. Try to do special when player found
execute if entity @s[tag=vexp.mob_special_ready] run function vexp:custom_mobs/behaviour/special_attack_ready_wrapper with entity @s data.vexp.mob

# 3. Remove tag so the mob can retry the search
tag @s remove vexp.mob_special_ready
