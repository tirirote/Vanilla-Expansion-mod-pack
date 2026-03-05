# dungeons/rapier/on_combo.mcfunction
# @s is the target entity

# Strong push away for the mob
function vexp:utils/motion/apply_knockback {strength:2, y:0.4}

# Strong recoil for the player
# We execute as mob facing the player to get the reverse vector?
# Or just use the same logic but inverse strength.
# Let's use a simpler version: execute at player facing mob to get direction.
execute as @p[tag=vexp.attacker,limit=1,distance=..6] at @s run function vexp:utils/motion/apply_knockback {strength:-1.0, y:0.25}

# Visuals
particle minecraft:cloud ~ ~1.2 ~ 0.2 0.2 0.2 0.1 20
playsound minecraft:entity.player.attack.knockback player @a ~ ~ ~ 1 1.5
