# dungeons/gauntlets/netherite/on_right_click.mcfunction
# @s is the player

# Standard parry window but longer for netherite (5s = 100 ticks)
tag @s add vexp.gauntlets.parry
scoreboard players set @s vexp.gauntlets_parry_timer 100
scoreboard players operation @s vexp.gauntlets_damage_snapshot = @s vexp.damage_taken

# Effects
effect give @s minecraft:slowness 5 1 true
effect give @s minecraft:resistance 5 0 true

# Visual
particle minecraft:flame ~ ~-.5 ~ 0.25 0.25 0.25 0.05 5
particle minecraft:smoke ~ ~-.5 ~ 0.25 0.25 0.25 0.05 5
function vexp:utils/sound {sound: "minecraft:entity.blaze.burn", type: "player"}
