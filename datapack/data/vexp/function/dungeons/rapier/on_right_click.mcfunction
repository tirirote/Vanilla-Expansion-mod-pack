# dungeons/rapier/on_right_click.mcfunction
# @s is the player

# Lunge forward in short steps to pierce through nearby mobs.
execute if block ^ ^-1.25 ^1 #minecraft:replaceable run tp @s ^ ^-1.25 ^1
execute if block ^ ^-1.25 ^1 #minecraft:replaceable run tp @s ^ ^-1.25 ^1
execute if block ^ ^-1.25 ^1 #minecraft:replaceable run tp @s ^ ^-1.25 ^1

# Brief invisibility after the lunge.
effect give @s minecraft:invisibility 1 0 true
effect give @s speed 3 0 true
effect give @s glowing 1 0 true

# Visuals
particle minecraft:cloud ~ ~ ~ 0.2 0.2 0.2 0.05 10
particle effect ~ ~ ~ 0.2 0.2 0.2 0.1 5
function vexp:utils/sound {sound: "minecraft:entity.phantom.flap", type: "player"}
