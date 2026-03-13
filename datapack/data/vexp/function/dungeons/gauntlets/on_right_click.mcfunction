# dungeons/gauntlets/on_right_click.mcfunction
# @s is the player

# Brief self-penalty while entering parry stance
effect give @s minecraft:slowness 1 2 true
effect give @s minecraft:resistance 1 4 true

# Parry stance window and damage snapshot
tag @s add vexp.gauntlets.parry
scoreboard players set @s vexp.gauntlets_parry_timer 8
scoreboard players operation @s vexp.gauntlets_damage_snapshot = @s vexp.damage_taken

# Visual feedback
particle minecraft:electric_spark ~ ~1.2 ~ 0.5 0.5 0.5 0.1 20
function vexp:utils/sound {sound: "minecraft:item.shield.block", type: "player"}
