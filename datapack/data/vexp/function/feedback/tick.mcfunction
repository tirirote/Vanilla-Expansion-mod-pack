# vexp:feedback/tick
# Global feedback loop for combat readability.

# Debug heartbeat to verify this function is being executed.
scoreboard players add @a[tag=vexp.debug_feedback,gamemode=!spectator] vexp.debug_tick 1
execute as @a[tag=vexp.debug_feedback,gamemode=!spectator,scores={vexp.debug_tick=20..}] run tellraw @s [{"text":"[ATK DEBUG] feedback/tick running","color":"dark_aqua"}]
scoreboard players set @a[tag=vexp.debug_feedback,gamemode=!spectator,scores={vexp.debug_tick=20..}] vexp.debug_tick 0

# Player hurt detection (health delta, used by melee family functions)
tag @a remove vexp.player_hurt
execute as @a[gamemode=!spectator] store result score @s vexp.player_hp run data get entity @s Health 2
execute as @a[gamemode=!spectator] if score @s vexp.player_hp < @s vexp.player_hp_prev run tag @s add vexp.player_hurt
execute as @a[gamemode=!spectator] run scoreboard players operation @s vexp.player_hp_prev = @s vexp.player_hp

# Enemy attack-ready feedback check (timer-based per enemy family)
execute as @e[predicate=vexp:is_target] unless entity @s[tag=vexp.custom_block.dummy] at @s run function vexp:feedback/enemy_attack_ready_timer
