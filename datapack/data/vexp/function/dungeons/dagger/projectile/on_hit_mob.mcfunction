# projectile/on_hit_mob.mcfunction
# Efecto al golpear una entidad
# @s es el proyectil
# @e[tag=vexp.proj_target] es el mob objetivo (ya marcado por el sistema base)

# Quitar durabilidad
scoreboard players add @s vexp.damage 1

# Efectos visuales
execute positioned ~ ~1 ~ run function vexp:dungeons/dagger/projectile/hit_mob_effects

# Aplicar daño dinámico desde el NBT
execute store result score #temp vexp.math run data get entity @s data.proj.damage
execute as @e[tag=vexp.proj_target,limit=1] store result storage vexp:temp damage int 1 run scoreboard players get #temp vexp.math
data modify storage vexp:temp owner set value "@p[tag=vexp.dagger_owner,limit=1]"
execute as @e[tag=vexp.proj_target,limit=1] run function vexp:utils/apply_player_attack_damage with storage vexp:temp

# Pasar tag de material y daño al lanzador para devolver el item
execute if entity @s[tag=vexp.iron] run tag @p[tag=vexp.dagger_owner,limit=1] add vexp.iron
execute if entity @s[tag=vexp.wood] run tag @p[tag=vexp.dagger_owner,limit=1] add vexp.wood
execute if entity @s[tag=vexp.stone] run tag @p[tag=vexp.dagger_owner,limit=1] add vexp.stone
execute if entity @s[tag=vexp.gold] run tag @p[tag=vexp.dagger_owner,limit=1] add vexp.gold
execute if entity @s[tag=vexp.diamond] run tag @p[tag=vexp.dagger_owner,limit=1] add vexp.diamond
execute if entity @s[tag=vexp.copper] run tag @p[tag=vexp.dagger_owner,limit=1] add vexp.copper
execute if entity @s[tag=vexp.netherite] run tag @p[tag=vexp.dagger_owner,limit=1] add vexp.netherite
execute if entity @s[tag=vexp.echo] run tag @p[tag=vexp.dagger_owner,limit=1] add vexp.echo
execute if entity @s[tag=vexp.amethyst] run tag @p[tag=vexp.dagger_owner,limit=1] add vexp.amethyst

# 1. APPLY MARKS BY QUALITY
# NETHERITE: Mark mob
execute if entity @s[tag=vexp.netherite] as @e[tag=vexp.proj_target,limit=1] run function vexp:dungeons/states/nether_marked

# ECHO: Mark mob
execute if entity @s[tag=vexp.echo] as @e[tag=vexp.proj_target,limit=1] run function vexp:dungeons/states/echo_marked

# AMETHYST: Levitation + Fragmentation
execute if entity @s[tag=vexp.amethyst] as @e[tag=vexp.proj_target,limit=1] run effect give @s minecraft:levitation 2 1 true
execute if entity @s[tag=vexp.amethyst] as @e[tag=vexp.proj_target,limit=1] run effect give @s minecraft:slowness 2 1 true

# Fragmentation check: if target already levitating
execute if entity @s[tag=vexp.amethyst] as @e[tag=vexp.proj_target,limit=1,nbt={active_effects:[{id:"minecraft:levitation"}]}] run function vexp:dungeons/states/amethyst_fragmentation


# Transferir daño al dueño para la devolución con durabilidad correcta
scoreboard players operation @p[tag=vexp.dagger_owner,limit=1] vexp.damage = @s vexp.damage

# Devolver la daga al jugador
execute as @p[tag=vexp.dagger_owner,limit=1] at @s run function vexp:dungeons/dagger/give
