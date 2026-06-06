# @s is the player, @e[tag=vexp.hitted] is the mob

# Mark mob
function vexp:dungeons/states/echo_marked

#Teleport player behind mob
execute if data entity @s HurtTime positioned ~ ~.05 ~ if block ^ ^ ^-1 #replaceable run tp @p[tag=vexp.attacker,limit=1] ^ ^ ^-1 facing entity @s feet

#Buff
execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/echo_buffed

execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/strong_sword_hit
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/echo_hit

function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.warden.attack_impact", type: "player"}
