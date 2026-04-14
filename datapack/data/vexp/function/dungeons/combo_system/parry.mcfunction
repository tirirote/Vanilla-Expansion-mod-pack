# General parry window: trigger if player took damage during active parry timer
scoreboard players operation #parry_delta vexp.math = @s vexp.damage_taken
scoreboard players operation #parry_delta vexp.math -= @s vexp.parry_damage_snapshot

#Trigger Parry Hook
execute if score #parry_delta vexp.math matches 1.. run function vexp:dungeons/combo_system/hooks/apply_parry_wrapper

scoreboard players remove @s vexp.parry_timer 1
