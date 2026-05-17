# vexp:feedback/family/ranged_crossbow
# @s is a target entity.
# Arms attack timer for crossbow users from nearby spawned projectiles.

execute if entity @e[type=minecraft:arrow,distance=..1.8,limit=1,sort=nearest] run scoreboard players set @s vexp.enemy_atk_time 90
execute if entity @e[type=minecraft:arrow,distance=..1.8,limit=1,sort=nearest] run tag @s add vexp.feedback_atk_armed
execute if entity @e[type=minecraft:firework_rocket,distance=..1.8,limit=1,sort=nearest] run scoreboard players set @s vexp.enemy_atk_time 90
execute if entity @e[type=minecraft:firework_rocket,distance=..1.8,limit=1,sort=nearest] run tag @s add vexp.feedback_atk_armed

#Animation
execute if score @s vexp.enemy_atk_time matches 90 run particle flash{color:-2375021} ^ ^ ^1 1 1 1 1 0
execute if score @s vexp.enemy_atk_time matches 90 run particle crit ^ ^ ^1 0.1 0.1 0.1 0.35 15

execute if score @s vexp.enemy_atk_time matches ..10 run particle crit ^ ^ ^1 0 0 0 0 0

# Family-specific debug while testing
execute if score @s vexp.enemy_atk_time matches 24 if entity @e[type=minecraft:arrow,distance=..1.8,limit=1,sort=nearest] if entity @a[tag=vexp.debug_feedback,gamemode=!spectator,distance=..24] run tellraw @a[tag=vexp.debug_feedback,gamemode=!spectator,distance=..24] [{"text":"[ATK DEBUG] source=projectile_near(crossbow) | mob=","color":"gold"},{"selector":"@s","color":"yellow"}]
