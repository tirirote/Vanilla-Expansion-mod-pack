# dungeons/rapier/echo/on_right_click.mcfunction
# @s is the player

# Lunge forward in short steps to pierce through nearby mobs.
execute positioned ~ ~-.5 ~ if block ^ ^ ^1 #minecraft:replaceable if block ^ ^ ^2 #minecraft:replaceable if block ^ ^ ^3 #minecraft:replaceable if block ^ ^ ^4 #minecraft:replaceable if block ^ ^ ^5 #minecraft:replaceable if block ^ ^ ^6 #minecraft:replaceable run tp @s ^ ^ ^6

# Brief buff
effect give @s speed 2 2 true
effect give @s slow_falling 1 0 true
effect give @s blindness 1 0 true

# Visuals
#Netherite weapons hit particles
particle ominous_spawning ~ ~-.5 ~ 0.25 0.25 0.25 .1 5
particle flash{color:-8454162} ~ ~-.5 ~ 0.0 0.0 0.0 1 0
particle glow ~ ~ ~ 0.2 0.2 0.2 0.1 3
particle squid_ink ~ ~ ~ .1 .1 .1 0.1 3

function vexp:utils/sound {sound: "minecraft:block.sculk_sensor.clicking", type: "player"}

