# dungeons/sword/on_right_click.mcfunction
# @s is the player
scoreboard players set @s vexp.parry_timer 40
scoreboard players operation @s vexp.parry_damage_snapshot = @s vexp.damage_taken

particle flash{color:-8454162} ~ ~-.5 ~ 0 0 0 0 0
particle sculk_charge_pop ~ ~-.5 ~ 0.2 0.5 0.2 0.05 5
function vexp:utils/sound {sound: "minecraft:entity.warden.tendril_clicks", type: "player"}
