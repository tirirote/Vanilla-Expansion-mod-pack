# dungeons/axe_nether/projectile/on_hit_block.mcfunction
# @s is the projectile

# Start return phase immediately after colliding with a block
tag @s add vexp.prevent_despawn
tag @s add vexp.axe_returning
data modify entity @s data.proj.lifetime set value 20
execute if entity @p[tag=vexp.projectile_owner,limit=1] run tp @s ^ ^ ^-1.1 facing entity @p[tag=vexp.projectile_owner,limit=1] eyes

particle minecraft:flame ~ ~ ~ 0.2 0.2 0.2 0.02 8
