# @s is the primary hit mob

# 2. Strong knockback for the primary target
function vexp:utils/motion/apply_knockback {strength:-3.5, y:0.5}

# Hit feedback for primary target
particle large_smoke ~ ~ ~ 0.1 0.1 0.1 0.1 5
particle minecraft:lava ~ ~ ~ 0.1 0.1 0.1 0.1 1
particle angry_villager ~ ~ ~ .1 .1 .1 .1 3
function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}

# AoE damage and burn in ..2 around target
execute as @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,distance=..2] run damage @s 2 minecraft:player_attack by @p[tag=vexp.attacker,limit=1]
execute as @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,distance=..2] run data modify entity @s Fire set value 60
