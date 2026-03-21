# dungeons/dagger/on_combo.mcfunction
# @s is the target entity

# Strong pushback to target
function vexp:utils/motion/apply_knockback {strength:2.5, y:0.1}

# Dash
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1 ~ if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^-.5 ^1
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1 ~ if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^-.5 ^1

effect give @s minecraft:speed 1 1 true

# Visual/Sound
particle minecraft:enchanted_hit ~ ~ ~ .1 .1 .1 0.2 5
particle minecraft:gust ~ ~ ~ 0 0 0 1 1
function vexp:utils/sound {sound: "minecraft:entity.phantom.flap", type: "player"}
function vexp:utils/sound {sound: "minecraft:item.trident.throw", type: "player"}
