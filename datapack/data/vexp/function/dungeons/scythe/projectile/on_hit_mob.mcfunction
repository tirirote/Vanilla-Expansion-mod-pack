# dungeons/scythe/projectile/on_hit_mob.mcfunction
# Efecto al golpear una entidad
# @s es el proyectil
# @e[tag=vexp.proj_target] es el mob objetivo

# Copiar damage desde NBT al scoreboard temporal
execute store result score #temp vexp.math run data get entity @s data.proj.damage

# Aplicar daño desde el NBT del proyectil
execute as @e[tag=vexp.proj_target,limit=1] store result storage vexp:temp damage int 1 run scoreboard players get #temp vexp.math
execute as @e[tag=vexp.proj_target,limit=1] run function vexp:utils/apply_magic_damage with storage vexp:temp
execute as @e[tag=vexp.proj_target,limit=1] run function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.2}

# Efectos visuales y sonoros
particle minecraft:small_gust ~ ~ ~ 0.2 0.2 0.2 0.2 15
particle minecraft:gust ~ ~ ~ 0 0 0 1 1
function vexp:utils/sound {sound: " minecraft:block.trial_spawner.ominous_activate", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.player.attack.strong", type: "player"}
