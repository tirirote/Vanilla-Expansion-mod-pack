# dungeons/rapier/on_right_click.mcfunction
# @s is the player

# Lunge forward in short steps to pierce through nearby mobs.
execute positioned ~ ~-.5 ~ if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^ ^1
execute positioned ~ ~-.5 ~ if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^ ^1
execute positioned ~ ~-.5 ~ if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^ ^1

# Brief buff
effect give @s speed 2 2 true
effect give @s slow_falling 2 0 true

# Visuals
particle minecraft:cloud ~ ~-1.45 ~ 0.2 0.2 0.2 0.05 5
particle effect ~ ~-1.45 ~ 0.2 0.2 0.2 0.1 3
function vexp:utils/sound {sound: "minecraft:entity.phantom.flap", type: "player"}
