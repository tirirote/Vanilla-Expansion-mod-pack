# dungeons/gauntlets/netherite/on_parry.mcfunction
# @s is the player
# Uses storage vexp:dungeons.weapon parry_params {damage}

execute as @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,distance=..4.5,sort=nearest] run function vexp:dungeons/states/nether_marked
execute as @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,distance=..4.5,sort=nearest] run damage @s 2 minecraft:player_attack by @p[tag=vexp.attacker,limit=1]
