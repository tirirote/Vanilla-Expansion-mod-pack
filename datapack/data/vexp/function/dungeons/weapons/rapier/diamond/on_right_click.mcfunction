# dungeons/rapier/on_right_click.mcfunction
# @s is the player

# Lunge forward in short steps to pierce through nearby mobs.
execute positioned ~ ~-.5 ~ if block ^ ^ ^1 #minecraft:replaceable if block ^ ^ ^2 #minecraft:replaceable if block ^ ^ ^3 #minecraft:replaceable if block ^ ^ ^4 #minecraft:replaceable run tp @s ^ ^ ^4

# Brief buff
effect give @s speed 2 2 true
effect give @s slow_falling 1 0 true
effect give @s blindness 1 0 true

# Visuals
particle instant_effect{color:9437155} ~ ~-.5 ~ 0.25 0.25 0.25 0 1
particle instant_effect{color:49358} ~ ~-.5 ~ 0.25 0.25 0.25 0 1
particle flash{color:-7340061} ~ ~-.5 ~ 0.0 0.0 0.0 1 0
function vexp:utils/sound {sound: "minecraft:entity.breeze.jump", type: "player"}
function vexp:utils/sound {sound: "minecraft:item.trident.return", type: "player"}
