# Tag all valid entities in AoE range, centered 1 block above the player and $(reach) blocks forward.
# Guards removed: by the time this runs, @s is guaranteed to be the attacker (hitbox on_attack
# chain ensures correct player context), and a hitbox is guaranteed to exist.
scoreboard players operation #combo_owner_id vexp.id = @s vexp.id
$execute positioned ~ ~1 ~ positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,tag=!vexp.attacker,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id run tag @s add vexp.hitted
