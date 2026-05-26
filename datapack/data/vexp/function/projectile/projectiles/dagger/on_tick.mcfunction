# projectile/on_tick.mcfunction
# Efectos visuales del proyectil de daga cada tick
# @s es el proyectil

# Partículas de rastro
execute unless entity @s[tag=vexp.netherite] unless entity @s[tag=vexp.echo] unless entity @s[tag=vexp.glowing] unless entity @s[tag=vexp.gold] unless entity @s[tag=vexp.diamond] run particle crit ~ ~ ~ 0.0 0.0 0.0 0 0

# Sincronizar el display vinculado por ID con el marker
scoreboard players operation #temp vexp.id = @s vexp.id
execute at @s as @e[type=item_display,tag=vexp.dagger_display] if score @s vexp.id = #temp vexp.id run tp @s ~ ~ ~ ~ ~


# Quality-specific projectile hooks
execute if entity @s[tag=vexp.netherite] run function vexp:projectile/projectiles/dagger/netherite/on_tick
execute if entity @s[tag=vexp.echo] run function vexp:projectile/projectiles/dagger/echo/on_tick
execute if entity @s[tag=vexp.glowing] run function vexp:projectile/projectiles/dagger/glowing/on_tick
execute if entity @s[tag=vexp.gold] run function vexp:projectile/projectiles/dagger/gold/on_tick
execute if entity @s[tag=vexp.diamond] run function vexp:projectile/projectiles/dagger/diamond/on_tick
