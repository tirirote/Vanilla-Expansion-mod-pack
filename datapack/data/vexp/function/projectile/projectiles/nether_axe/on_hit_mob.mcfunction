# dungeons/axe_nether/projectile/on_hit_mob.mcfunction
# @s is the projectile

tag @s add vexp.prevent_despawn

execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] at @s run function vexp:utils/motion/apply_knockback {strength:0.01, y:0.01}

# Small explosion feedback
particle large_smoke ~ ~ ~ 0.1 0.1 0.1 0.1 1
particle minecraft:lava ~ ~ ~ 0.1 0.1 0.1 0.1 1
function vexp:utils/sound {sound: "minecraft:entity.firework_rocket.large_blast_far", type: "player"}
#minecraft:entity.firework_rocket.large_blast_far
# Light AoE damage and nether mark in ..2
data modify storage vexp:temp damage set value {damage:1, type:"minecraft:player_attack", owner:"@s"}
execute as @e[predicate=vexp:is_target,distance=..2] at @s run function vexp:utils/deal_damage with storage vexp:temp damage
execute as @e[predicate=vexp:is_target,distance=..2] run function vexp:dungeons/states/nether_marked
