# dungeons/sword/on_right_click.mcfunction
# @s is the player
scoreboard players set @s vexp.parry_timer 40
scoreboard players operation @s vexp.parry_damage_snapshot = @s vexp.damage_taken

#Player Buff
function vexp:dungeons/states/nether_buffed

particle trial_spawner_detection ~ ~-1.25 ~ .2 .2 .2 0.05 15
particle large_smoke ~ ~-1.25 ~ .2 .2 .2 .1 5
particle flash{color:-26073} ~ ~-1.25 ~ 0 0 0 0 0
function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}
