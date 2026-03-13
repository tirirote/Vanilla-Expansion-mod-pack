# @s is the player, @e[tag=vexp.hitted] is the mob

# Mark mob
execute as @e[tag=vexp.hitted] run function vexp:dungeons/states/echo_marked

# Effects
effect give @s minecraft:speed 2 1 true

# Stealth movement (brief invisibility and particles)
effect give @s minecraft:invisibility 1 0 true
particle minecraft:sculk_soul ~ ~1 ~ 0.5 0.5 0.5 0.1 20
