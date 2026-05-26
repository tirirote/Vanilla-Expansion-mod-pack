# Tag all valid entities in AoE range, centered 1 block above the player and $(reach) blocks forward.
# Guards removed: by the time this runs, @s is guaranteed to be the attacker (hitbox on_attack
# chain ensures correct player context), and a hitbox is guaranteed to exist.
$execute positioned ~ ~1 ~ positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,tag=!vexp.attacker,distance=..$(range)] run tag @s add vexp.hitted

# Apply damage to the hitted entity (effect-adjusted)
execute as @e[tag=vexp.hitted] run scoreboard players set @s vexp.hit_success 0
$execute as @e[tag=vexp.hitted] store success score @s vexp.hit_success run damage @s $(eff_damage) vexp:combo_hit by @p[tag=vexp.attacker,limit=1]
