# Dash damage
# @s is the target mob

tag @s add vexp.hitted

# Apply damage to the hitted entity (effect-adjusted)
execute as @s[tag=vexp.hitted] run scoreboard players set @s vexp.hit_success 0
$execute as @s[tag=vexp.hitted] store success score @s vexp.hit_success run damage @s $(damage) vexp:combo_hit by @p[tag=vexp.attacker,limit=1]

execute as @s[tag=vexp.hitted] at @s run function vexp:mob_health/spawn_damage_on_hit
