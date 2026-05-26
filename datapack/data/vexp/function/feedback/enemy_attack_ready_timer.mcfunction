# vexp:feedback/enemy_attack_ready_timer
# @s is a target entity.
# Simplified mode:
# - Ranged: arm when a projectile appears very close to the shooter.
# - Melee: arm by close player proximity.

# Debug heartbeat (one-time per entity) to confirm this function is running.
execute if entity @a[tag=vexp.debug_feedback,gamemode=!spectator,distance=..24] run tag @s add vexp.dbg_feedback_seen

# 1) Tick down active timer
scoreboard players add @s vexp.enemy_atk_time 0
scoreboard players remove @s[scores={vexp.enemy_atk_time=1..}] vexp.enemy_atk_time 1

# 2) Family-specific arming logic (split for per-family feedback animation hooks)
#Ranged
execute if entity @s[type=#vexp:feedback_ranged_bow] positioned ~ ~1.5 ~ if block ^ ^ ^0.2 #air if entity @p[distance=..16] run function vexp:feedback/family/ranged_bow
execute if entity @s[type=#vexp:feedback_ranged_bow] positioned ~ ~1.5 ~ unless block ^ ^ ^0.2 #air unless entity @p[distance=..16] run scoreboard players set @s vexp.enemy_atk_time 0

execute if entity @s[type=#vexp:feedback_ranged_crossbow] positioned ~ ~1.5 ~ if block ^ ^ ^0.2 #air if entity @p[distance=..16] run function vexp:feedback/family/ranged_crossbow
execute if entity @s[type=#vexp:feedback_ranged_crossbow] positioned ~ ~1.5 ~ unless block ^ ^ ^0.2 #air unless entity @p[distance=..16] run scoreboard players set @s vexp.enemy_atk_time 0
#Meelee - standard reach (~2.5 blocks)
execute if entity @s[type=#vexp:feedback_melee_20] unless predicate vexp:enemy_holding_extended_reach if entity @p[gamemode=!spectator,distance=..1.5] run function vexp:feedback/family/melee_20
execute if entity @s[type=#vexp:feedback_melee_30] unless predicate vexp:enemy_holding_extended_reach if entity @p[gamemode=!spectator,distance=..1.5] run function vexp:feedback/family/melee_30

#Meelee - extended reach (trident ~4.5, scythe ~5.5)
execute if entity @s[type=#vexp:feedback_melee_20] if predicate vexp:enemy_holding_extended_reach if entity @p[gamemode=!spectator,distance=..4.5] positioned ^ ^ ^2 run function vexp:feedback/family/melee_20
execute if entity @s[type=#vexp:feedback_melee_30] if predicate vexp:enemy_holding_extended_reach if entity @p[gamemode=!spectator,distance=..4.5] positioned ^ ^ ^2 run function vexp:feedback/family/melee_30

# 3) One-shot warning exactly when timer reaches 0 (only for armed entities)
execute if entity @s[tag=vexp.feedback_atk_armed] if score @s vexp.enemy_atk_time matches 0 if entity @s[tag=!vexp.feedback_atk_warned] run tag @s add vexp.feedback_atk_warned


# 4) Clear one-shot guard once the timer is active again
execute if score @s vexp.enemy_atk_time matches 1.. run tag @s remove vexp.feedback_atk_warned
