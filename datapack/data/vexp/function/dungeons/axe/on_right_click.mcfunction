# dungeons/axe/on_right_click.mcfunction
# @s is the player

#Aoe damage to near mobs
tag @s add vexp.state.common_berserk
scoreboard players set @s vexp.dstate 40

#Visuals
particle minecraft:large_smoke ~ ~-0.5 ~ 0.2 0.2 0.2 0.1 5
particle trial_spawner_detection ~ ~-1.25 ~ 0.5 0.0 0.5 0.05 25
particle lava ~ ~-0.5 ~ 0.0 0.0 0.0 1 1
function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player"}
function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}

