# @s is the player, @e[tag=vexp.hitted] is the mob

function vexp:utils/motion/apply_knockback {strength:-1.0, y:0.1}

#Buff
execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/nether_buffed

execute positioned ~ ~1 ~ run function vexp:utils/hits/weak_sword_hit
execute positioned ~ ~1 ~ run function vexp:utils/hits/netherite_hit

function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player"}
