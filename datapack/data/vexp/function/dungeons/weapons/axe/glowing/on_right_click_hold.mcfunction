# Axe on hold right click hook
# @s is the player

function vexp:dungeons/fx/hold/glowing {score:vexp.skill_hold_time, start:3, end:8, loop:36}
execute if score @s vexp.skill_hold_time matches 8 run function vexp:utils/sound {sound: "minecraft:entity.glow_squid.squirt", type: "player", pitch:1}
