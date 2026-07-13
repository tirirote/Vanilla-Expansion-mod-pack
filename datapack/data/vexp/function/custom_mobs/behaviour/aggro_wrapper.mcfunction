# Trigger custom aggro hook
$function vexp:custom_mobs/mobs/$(type)/on_aggro

# Move towards target
$execute if entity @e[tag=vexp.mob_target,distance=2..16] run function vexp:custom_mobs/helpers/try_pathfinding {speed: $(speed), target_tag:"vexp.mob_target"}

# Clean aggro tags
execute if entity @s[tag=vexp.mob_attack_ready] run tag @s remove vexp.mob_aggro
execute if entity @s[tag=vexp.mob_special_ready] run tag @s remove vexp.mob_aggro
execute if entity @s[tag=vexp.mob_trying_to_pickup] run tag @s remove vexp.mob_aggro
execute if entity @s[tag=vexp.mob_got_item] run tag @s remove vexp.mob_aggro

execute unless entity @e[tag=vexp.mob_target,distance=..12,limit=1] run tag @s remove vexp.mob_aggro
