# @s is the player, @e[tag=vexp.hitted] is the mob

# Mark mob
function vexp:dungeons/states/echo_marked

#teleport player behind mob
execute positioned ~ ~.25 ~ run tp @p[tag=vexp.attacker,limit=1] ^ ^ ^-1.5 facing entity @s feet

# Effects
execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/echo_buffed
particle minecraft:sculk_soul ~ ~1 ~ 0.2 0.2 0.2 0.05 3
execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.3, 0.5, 0.55], scale: 0.8, dX: 0.2, dY: 0.2, dZ: 0.2, speed: 0.05, count: 1}
function vexp:utils/sound {sound: "minecraft:entity.warden.attack_impact", type: "player"}
