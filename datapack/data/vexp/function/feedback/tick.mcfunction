# vexp:feedback/tick
# Global feedback loop for combat readability.

# Player hurt detection (health delta, used by melee family functions)
tag @a remove vexp.player_hurt
execute as @a[gamemode=!spectator] store result score @s vexp.player_hp run data get entity @s Health 2
execute as @a[gamemode=!spectator] if score @s vexp.player_hp < @s vexp.player_hp_prev run tag @s add vexp.player_hurt
execute as @a[gamemode=!spectator] run scoreboard players operation @s vexp.player_hp_prev = @s vexp.player_hp

# Enemy attack-ready feedback check (timer-based per enemy family)
execute as @e[predicate=vexp:is_target] unless entity @s[tag=vexp.custom_block.dummy_mob] at @s run function vexp:feedback/enemy_attack_ready_timer
