# dungeons/scythe/projectile/on_hit_mob.mcfunction
# Efecto al golpear una entidad
# @s es el proyectil
# @e[tag=vexp.proj_target] es el mob objetivo

# Copiar damage desde NBT al scoreboard temporal
execute store result score #temp vexp.math run data get entity @s data.proj.damage

# Aplicar daño desde el NBT del proyectil
execute as @e[tag=vexp.proj_target,limit=1] store result storage vexp:temp damage int 1 run scoreboard players get #temp vexp.math
execute as @e[tag=vexp.proj_target,limit=1] run function vexp:utils/apply_magic_damage with storage vexp:temp

# Aplicar slowness
execute as @e[tag=vexp.proj_target,limit=1] run effect give @s minecraft:slowness 3 1 true

# Efectos visuales y sonoros
particle minecraft:squid_ink ~ ~ ~ 0.15 0.15 0.15 0.05 5
function vexp:utils/sound {sound: " minecraft:block.trial_spawner.ominous_activate", type: "player"}
