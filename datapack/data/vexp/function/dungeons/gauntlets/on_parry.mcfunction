# dungeons/gauntlets/on_parry.mcfunction
# @s is the player
# Uses storage vexp:main parry_params {damage}

$execute as @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,distance=..2.5,sort=nearest] run damage @s $(damage) minecraft:player_attack by @p[tag=vexp.attacker,limit=1]
