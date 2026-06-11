# vexp:feedback/family/melee_30
# @s is a target entity.
# Arms attack timer when a nearby player takes damage (melee hit detection).

execute if entity @p[tag=vexp.player_hurt] run scoreboard players set @s vexp.enemy_atk_time 30
execute if entity @p[tag=vexp.player_hurt] run tag @s add vexp.feedback_atk_armed

#Animation
execute if score @s vexp.enemy_atk_time matches 30 positioned ~ ~1.5 ~ run particle flash{color:-5398911} ^ ^ ^1 1 1 1 1 0
execute if score @s vexp.enemy_atk_time matches 30 positioned ~ ~1.5 ~ run particle crit ^ ^ ^1 0.1 0.1 0.1 0.35 5

execute if score @s vexp.enemy_atk_time matches ..15 positioned ~ ~1.5 ~ run particle crit ^ ^ ^1 0.1 0.1 0.1 0 1

# Family-specific debug while testing
execute if score @s vexp.enemy_atk_time matches 30 if entity @a[tag=vexp.debug_feedback,gamemode=!spectator,distance=..24] run tellraw @a[tag=vexp.debug_feedback,gamemode=!spectator,distance=..24] [{"text":"[ATK DEBUG] source=player_hurt(30) | mob=","color":"gold"},{"selector":"@s","color":"yellow"}]
