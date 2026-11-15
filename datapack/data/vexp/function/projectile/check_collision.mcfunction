# projectile/check_collision.mcfunction
# Detección de colisiones con mobs y bloques
# @s es el proyectil

# Copy ID
scoreboard players operation #owner_id vexp.math = @s vexp.id

# Mob Collisions
execute if block ^ ^ ^0.2 #minecraft:replaceable if entity @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] unless score @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] vexp.id = #owner_id vexp.math run function vexp:projectile/on_hit_mob with entity @s data.proj

# Block Collisions
execute unless block ^ ^ ^0.2 #minecraft:replaceable run function vexp:projectile/on_hit_block
