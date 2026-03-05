# dungeons/dagger/on_combo.mcfunction
# @s is the target entity

# Strong pushback to target
function vexp:utils/motion/apply_knockback {strength:1.5, y:0.5}

# Recoil for the player
execute as @p[tag=vexp.attacker,limit=1] at @s run function vexp:utils/motion/apply_knockback {strength:-1.0, y:0.2}

# Visual/Sound
particle minecraft:gust ~ ~1.2 ~ 0 0 0 0 1
playsound minecraft:entity.player.attack.knockback player @a ~ ~ ~ 1 1.2
