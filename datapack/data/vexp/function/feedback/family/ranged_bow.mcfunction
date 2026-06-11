# vexp:feedback/family/ranged_bow
# @s is a target entity.
# Arms attack timer for bow users from nearby spawned projectiles.

execute if entity @e[type=minecraft:arrow,distance=..1.8,limit=1,sort=nearest,nbt={inGround:0b}] run scoreboard players set @s vexp.enemy_atk_time 60
execute if entity @e[type=minecraft:arrow,distance=..1.8,limit=1,sort=nearest,nbt={inGround:0b}] run tag @s add vexp.feedback_atk_armed
execute if entity @e[type=minecraft:spectral_arrow,distance=..1.8,limit=1,sort=nearest,nbt={inGround:0b}] run scoreboard players set @s vexp.enemy_atk_time 60
execute if entity @e[type=minecraft:spectral_arrow,distance=..1.8,limit=1,sort=nearest,nbt={inGround:0b}] run tag @s add vexp.feedback_atk_armed

#Animation
execute if score @s vexp.enemy_atk_time matches 60 run particle flash{color:-5398911} ^ ^ ^1 1 1 1 1 0
execute if score @s vexp.enemy_atk_time matches 60 run particle crit ^ ^ ^1 0.1 0.1 0.1 0.35 5

execute if score @s vexp.enemy_atk_time matches 60 run playsound item.crossbow.shoot hostile @p[distance=..32]

execute if score @s vexp.enemy_atk_time matches 20 run playsound item.crossbow.loading_end hostile @p[distance=..32]
execute if score @s vexp.enemy_atk_time matches 10 run playsound item.crossbow.loading_middle hostile @p[distance=..32]

execute if score @s vexp.enemy_atk_time matches ..10 run particle crit ^ ^ ^1 0 0 0 0 0

# Family-specific debug while testing
execute if score @s vexp.enemy_atk_time matches 40 if entity @e[type=minecraft:arrow,distance=..1.8,limit=1,sort=nearest] if entity @a[tag=vexp.debug_feedback,gamemode=!spectator,distance=..24] run tellraw @a[tag=vexp.debug_feedback,gamemode=!spectator,distance=..24] [{"text":"[ATK DEBUG] source=projectile_near(bow) | mob=","color":"gold"},{"selector":"@s","color":"yellow"}]
