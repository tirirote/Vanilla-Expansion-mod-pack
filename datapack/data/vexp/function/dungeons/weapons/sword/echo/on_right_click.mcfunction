# dungeons/sword/on_right_click.mcfunction
# @s is the player
scoreboard players set @s vexp.parry_timer 40
scoreboard players operation @s vexp.parry_damage_snapshot = @s vexp.damage_taken

function vexp:dungeons/fx/right_click/echo
