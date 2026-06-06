# dungeons/bow/arrows/types/resonance/on_hit_mob_charged.mcfunction
# @s is a resonance-quality bow arrow, fully charged, hitting a mob

#Tp Behind mob
execute as @p[tag=vexp.arrow.owner,limit=1] at @s if entity @e[predicate=vexp:is_target,tag=vexp.glow_buffed,sort=nearest,limit=1,distance=..16] run function vexp:dungeons/states/glow_buffed

#Mark the target
execute as @e[predicate=vexp:is_target,sort=nearest,limit=1,distance=..2] run function vexp:dungeons/states/glow_marked

function vexp:dungeons/fx/hits/glowing_hit

function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.glow_squid.squirt", type: "player"}
