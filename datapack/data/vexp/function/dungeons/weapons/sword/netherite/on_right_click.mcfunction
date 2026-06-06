# dungeons/sword/on_right_click.mcfunction
# @s is the player
scoreboard players set @s vexp.parry_timer 40
scoreboard players operation @s vexp.parry_damage_snapshot = @s vexp.damage_taken

particle flame ~ ~-1 ~ .2 .5 .2 0.05 5
particle flash{color:-26073} ~ ~-1 ~ 0 0 0 0 0
function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}
