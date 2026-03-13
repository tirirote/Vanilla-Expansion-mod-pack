# dungeons/sword_nether/projectile/on_hit_mob.mcfunction
# @s is the projectile

particle minecraft:flame ~ ~ ~ 0.2 0.2 0.2 0.03 10
particle minecraft:lava ~ ~ ~ 0.1 0.1 0.1 0.05 3
playsound minecraft:item.firecharge.use ambient @a ~ ~ ~ 0.8 1.2

# Reduced AoE damage and burn around impact.
execute as @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,distance=..1.6] run damage @s 1 minecraft:player_attack
execute as @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,distance=..1.6] run data modify entity @s Fire set value 50
