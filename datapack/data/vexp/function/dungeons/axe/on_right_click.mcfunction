# dungeons/axe/on_right_click.mcfunction
# @s is the player

#Aoe damage to near mobs
execute as @e[predicate=vexp:is_target,distance=..3.5] at @s run function vexp:dungeons/axe/bury

#Visuals
function vexp:utils/sound {sound: "minecraft:item.shield.block", type: "player"}
particle cloud ~ ~ ~ 0.0 0.0 0.0 0.1 5
execute positioned ~ ~-1.5 ~ run function vexp:utils/feedback/block_hit

