# dungeons/sword_nether/projectile/on_hit_block.mcfunction
# @s is the projectile

particle minecraft:flame ~ ~ ~ 0.25 0.25 0.25 0.03 8
particle minecraft:large_smoke ~ ~ ~ 0.15 0.15 0.15 0.05 5

# Reduced AoE damage and burn around block impact.
execute as @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,distance=..1.6] run damage @s 1 minecraft:player_attack
execute as @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,distance=..1.6] run data modify entity @s Fire set value 50
