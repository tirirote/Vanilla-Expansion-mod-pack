# dungeons/rapier/on_right_click.mcfunction
# @s is the player

# Lunge forward in short steps to pierce through nearby mobs.
execute if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^ ^1
execute if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^ ^1
execute if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^ ^1

# Apply bleeding (wither) to nearby mobs at lunge destination.
execute as @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,distance=..2.2,limit=6,sort=nearest] run effect give @s minecraft:wither 3 0 true

# Brief invisibility after the lunge.
effect give @s minecraft:invisibility 1 0 true

# Visuals
particle minecraft:poof ~ ~ ~ 0.25 0.5 0.25 0.1 25
particle minecraft:sweep_attack ~ ~1 ~ 0 0 0 0 1
function vexp:utils/sound {sound: "minecraft:entity.phantom.flap", type: "player"}
