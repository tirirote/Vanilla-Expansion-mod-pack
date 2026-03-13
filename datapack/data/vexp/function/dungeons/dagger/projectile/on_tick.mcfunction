# projectile/on_tick.mcfunction
# Efectos visuales del proyectil de daga cada tick
# @s es el proyectil

# Partículas de rastro
particle minecraft:dust_plume ~ ~ ~ 0 0 0 0 1

# Sincronizar el display con el marker
execute at @s as @e[tag=vexp.dagger_display,limit=1,distance=..2,sort=nearest] run tp @s ~ ~ ~ ~ ~

# Amethyst Control: Sync rotation with owner
execute if entity @s[tag=vexp.amethyst] at @p[tag=vexp.dagger_owner,limit=1] run tp @s ~ ~ ~ ~ ~

