# dungeons/axe/on_combo.mcfunction
# @s is the target entity (one of them)

# 1. Damage all mobs in front of the player
# We execute as the player to use their facing.
execute as @p[tag=vexp.attacker,limit=1,distance=..6] at @s as @e[type=!player,type=!item,distance=..5,limit=10] run function vexp:dungeons/axe/apply_sweep

# 2. Strong knockback for the primary target
function vexp:utils/motion/apply_knockback {strength:2.5, y:0.4}

# Visuals
particle minecraft:sweep_attack ~ ~1.2 ~ 1 0.5 1 0 5
playsound minecraft:entity.player.attack.sweep player @a ~ ~ ~ 1 0.5
