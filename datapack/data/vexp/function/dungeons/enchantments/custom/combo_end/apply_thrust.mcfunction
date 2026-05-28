# Thrust I/II: speed buff only.

execute if score #ench_thrust vexp.math matches 1 run effect give @s minecraft:speed 5 0 true
execute if score #ench_thrust vexp.math matches 2.. run effect give @s minecraft:speed 5 1 true

execute if score #ench_thrust vexp.math matches 1 run effect give @s minecraft:jump_boost 5 0 true
execute if score #ench_thrust vexp.math matches 2.. run effect give @s minecraft:jump_boost 5 1 true
effect give @s glowing 2 0 true
# Feedback
particle flash{color:-1} ~ ~ ~ 1 1 1 1 0

particle end_rod ~ ~1 ~ 0.35 0.35 0.35 0.1 3
particle instant_effect{color:-1,power:-1} ~ ~ ~ 0.5 0.2 0.5 0 10
function vexp:utils/sound {sound: "minecraft:block.beacon.activate", type: "player"}

execute at @s positioned ~ ~1 ~ if block ^ ^ ^-1 #replaceable run tp @s ^ ^-0.9 ^-1
execute at @s positioned ~ ~1 ~ if block ^ ^ ^-1 #replaceable run tp @s ^ ^-0.9 ^-1
execute at @s positioned ~ ~1 ~ if block ^ ^ ^-1 #replaceable run tp @s ^ ^-0.9 ^-1
