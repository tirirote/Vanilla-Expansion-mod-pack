# dungeons/states/amethyst_physics.mcfunction
# @s is the mob with amethyst mark
# Prevents clipping through blocks while levitating or moving

# Simplified: if inside block, TP out (upwards or to last safe pos)
# In practice for 1.21.1, we can use simple checks
execute if block ~ ~ ~ #minecraft:inside_step run tp @s ~ ~0.1 ~
execute if block ~ ~1.8 ~ #minecraft:inside_step run tp @s ~ ~-0.1 ~
