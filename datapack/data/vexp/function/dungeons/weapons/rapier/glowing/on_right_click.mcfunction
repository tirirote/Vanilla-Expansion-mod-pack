# dungeons/rapier/glowing/on_right_click.mcfunction
# @s is the player

# Lunge forward
execute positioned ~ ~-.5 ~ if block ^ ^ ^1 #minecraft:replaceable if block ^ ^ ^2 #minecraft:replaceable if block ^ ^ ^3 #minecraft:replaceable if block ^ ^ ^4 #minecraft:replaceable run tp @s ^ ^ ^4

effect give @s speed 1 1 true
effect give @s slow_falling 1 0 true

particle glow ~ ~-.5 ~ 0.25 0.25 0.25 .1 5
function vexp:utils/sound {sound: "minecraft:entity.player.attack.sweep", type: "player"}
