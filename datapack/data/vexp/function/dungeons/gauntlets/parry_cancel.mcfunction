# dungeons/gauntlets/parry_cancel.mcfunction
# @s is the player

tag @s remove vexp.gauntlets.parry
scoreboard players set @s vexp.gauntlets_parry_timer 0
