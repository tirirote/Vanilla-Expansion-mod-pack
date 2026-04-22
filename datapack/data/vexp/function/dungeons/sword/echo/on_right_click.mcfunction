# dungeons/sword/on_right_click.mcfunction
# @s is the player
scoreboard players set @s vexp.parry_timer 40
scoreboard players operation @s vexp.parry_damage_snapshot = @s vexp.damage_taken

#Echo Buffed
function vexp:dungeons/states/echo_buffed

particle flash{color:-8454162} ~ ~-.5 ~ 0 0 0 0 0
particle trial_spawner_detection_ominous ~ ~-.5 ~ .2 .2 .2 0.05 5
particle instant_effect{color:9497087} ~ ~-.5 ~ 0.2 0.2 0.2 0 5
particle minecraft:squid_ink ~ ~-.5 ~ 0.2 0.2 0.2 0.1 5
function vexp:utils/sound {sound: "minecraft:entity.warden.tendril_clicks", type: "player"}
