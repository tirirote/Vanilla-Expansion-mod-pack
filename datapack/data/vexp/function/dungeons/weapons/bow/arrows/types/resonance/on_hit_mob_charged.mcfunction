# dungeons/bow/arrows/types/resonance/on_hit_mob_charged.mcfunction
# @s is a resonance-quality bow arrow, fully charged, hitting a mob

#Tp Behind mob
execute as @e[predicate=vexp:is_target,tag=vexp.echo_marked,sort=nearest,limit=1,distance=..16] at @s positioned ~ ~.05 ~ if block ^ ^ ^-5 #replaceable run tp @p[tag=vexp.arrow.owner,limit=1] ^ ^ ^-5

#Buff Player
execute as @p[tag=vexp.arrow.owner,limit=1] run function vexp:dungeons/states/echo_buffed

#Mark the target
execute as @e[predicate=vexp:is_target,sort=nearest,limit=1,distance=..2] run function vexp:dungeons/states/echo_marked

function vexp:dungeons/fx/hits/echo_hit

function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.warden.attack_impact", type: "player"}
