# dungeons/nether/projectile/on_hit_mob.mcfunction
# @s is the nether proj, @e[tag=vexp.proj_target] is the mob
# Light AoE damage and nether mark in ..2
tag @s add vexp.prevent_despawn

data modify storage vexp:temp damage.damage set from entity @s data.proj.damage
execute as @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,distance=..3] at @s run function vexp:utils/deal_damage {damage:1, type:"minecraft:player_attack", owner:"@s"}
execute as @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,distance=..3] at @s run function vexp:dungeons/states/nether_marked
execute as @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,distance=..3] at @s run function vexp:utils/motion/apply_knockback {strength:-1.0, y:0.2}

particle angry_villager ~ ~ ~ .1 .1 .1 0.1 1
function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.4, 0.35, 0.3], scale: 1.7, dX: 0.2, dY: 0.2, dZ: 0.2, speed: 0.05, count: 1}
function vexp:utils/sound {sound: "minecraft:entity.firework_rocket.blast_far", type: "player"}
