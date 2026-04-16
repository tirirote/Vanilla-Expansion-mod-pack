#Visuals
particle campfire_cosy_smoke ~ ~ ~ .2 .2 .2 0.005 3
particle lava ~ ~ ~ 0.2 0.2 0.2 0 3
particle explosion ~ ~ ~ 0.0 0.0 0.0 0 0

execute as @e[predicate=vexp:is_target,distance=..2] at @s positioned ~ ~1 ~ run function vexp:utils/apply_player_attack_damage {damage: 2, owner: "@p[tag=vexp.attacker]"}
execute as @e[predicate=vexp:is_target,distance=..2] at @s positioned ~ ~1 ~ run function vexp:utils/motion/apply_knockback {strength:-2.5, y:0.1}
