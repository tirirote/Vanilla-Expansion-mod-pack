# dungeons/echo/projectile/on_hit_mob.mcfunction
# @s is the echo proj, @e[tag=vexp.proj_target] is the mob

# Apply mark to current target
execute as @e[tag=vexp.proj_target,limit=1] run function vexp:dungeons/states/echo_marked

# Sound
playsound minecraft:entity.warden.attack_impact ambient @a ~ ~ ~ 1 1.5
particle minecraft:sculk_charge_pop ~ ~ ~ 0.5 0.5 0.5 0.1 10

# BOUNCE LOGIC
# Find next target within 3 blocks that is NOT already marked (avoiding loops)
execute at @s as @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,distance=..3,limit=1,sort=nearest,tag=!vexp.echo_marked] run tag @s add vexp.next_target

# If next target found, prevent despawn and rotate towards it
execute if entity @e[tag=vexp.next_target] run tag @s add vexp.prevent_despawn
execute if entity @e[tag=vexp.next_target] at @s facing entity @e[tag=vexp.next_target,limit=1] eyes run tp @s ~ ~ ~ ~ ~

# Cleanup tags
tag @e[tag=vexp.next_target] remove vexp.next_target
