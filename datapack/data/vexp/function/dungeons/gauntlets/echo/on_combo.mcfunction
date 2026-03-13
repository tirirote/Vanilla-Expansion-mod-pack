# dungeons/gauntlets/echo/on_combo.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Teleport behind mob
execute at @e[tag=vexp.hitted,limit=1] run tp @s ^ ^ ^-1.5

# AoE push and effects
particle minecraft:sculk_soul ~ ~1 ~ 1 0.5 1 0.1 30
playsound minecraft:entity.warden.sonic_boom ambient @a ~ ~ ~ 1 1.5

execute as @e[type=!player,type=!item,type=!marker,distance=..4] at @s run function vexp:utils/deal_damage {amount:2.0}
execute as @e[type=!player,type=!item,type=!marker,distance=..4] run effect give @s minecraft:slowness 3 1 true
execute as @e[type=!player,type=!item,type=!marker,distance=..4] run effect give @s minecraft:blindness 3 0 true
# Knockback {strength:1.0, y:0.25}
data modify storage vexp:temp motion set value {strength:1.0, y:0.25}
execute as @e[type=!player,type=!item,type=!marker,distance=..4] at @s run function vexp:utils/motion/apply_knockback with storage vexp:temp motion

