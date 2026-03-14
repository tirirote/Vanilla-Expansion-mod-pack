# Netherite projectile hook on entity hit
execute as @e[tag=vexp.proj_target,limit=1] run function vexp:dungeons/states/nether_marked
particle minecraft:lava ~ ~1 ~ 1 0.2 1 0 1
particle explosion ~ ~1 ~ 0 0 0 1 1
particle large_smoke ~ ~1 ~ 0.2 0.2 0.2 0.1 3
function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.firework_rocket.large_blast_far", type: "player"}
