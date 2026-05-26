# dungeons/gauntlets/on_right_click.mcfunction
# @s is the player
# Attempt to catch a mob if none are currently caught

execute positioned ^ ^ ^2.5 as @e[predicate=vexp:is_target,tag=!vexp.state.catched,distance=..3.5,limit=1,sort=nearest] at @s run function vexp:dungeons/states/catched

#Feedback
particle instant_effect ^ ^ ^2.5 0.2 0.2 0.2 .1 3
particle crit ^ ^ ^2.5 0.2 0.2 0.2 .1 3
function vexp:utils/sound {sound: "minecraft:item.crossbow.loading_end", type: "player"}
