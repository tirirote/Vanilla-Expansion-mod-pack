# Tag all valid entities in AoE range, centered on the player's hitbox entity
$execute as @e[type=interaction,tag=vexp.combo_hitbox] if score @s vexp.id = @p[tag=vexp.attacker,limit=1] vexp.id at @s as @e[predicate=vexp:is_target,tag=!vexp.attacker,distance=..$(range)] run tag @s add vexp.hitted

# Apply damage to the hitted entity (effect-adjusted)
execute as @e[tag=vexp.hitted] run scoreboard players set @s vexp.hit_success 0
$execute as @e[tag=vexp.hitted] store success score @s vexp.hit_success run damage @s $(eff_damage) vexp:combo_hit by @p
