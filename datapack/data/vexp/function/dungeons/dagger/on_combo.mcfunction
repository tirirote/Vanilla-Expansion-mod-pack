# dungeons/dagger/on_combo.mcfunction
# @s is the target entity

# Strong pushback to target
function vexp:utils/motion/apply_knockback {strength:0.05, y:0.1}

# Dash
#execute if block ^ ^.5 ^-2.5 #replaceable run tp @p[tag=vexp.attacker,limit=1] ^ ^.5 ^-2.5 facing entity @s
effect give @s minecraft:speed 3 1 true

# Visual/Sound
execute positioned ~ ~1 ~ run function vexp:utils/hits/strong_sword_hit
