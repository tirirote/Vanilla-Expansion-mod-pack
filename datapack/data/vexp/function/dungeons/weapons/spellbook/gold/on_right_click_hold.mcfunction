# Spellbook on hold right click hook
# @s is the playerr

execute positioned ~ ~-0.25 ~ positioned ^ ^ ^-1 run function vexp:dungeons/fx/hold/gold {score:vexp.skill_hold_time, start:3, end:8, loop:36}
execute if score @s vexp.skill_hold_time matches 8 run function vexp:utils/sound {sound: "minecraft:entity.ender_eye.death", type: "player", pitch:1}
