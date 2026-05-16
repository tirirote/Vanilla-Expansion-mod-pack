# General parry window: trigger if player took damage during active parry timer
# Proactive damage reduction
effect give @s minecraft:resistance 2 2 true

# Attempt projectile deflect while parry window is active
function vexp:dungeons/combo_system/hooks/parry_deflect

scoreboard players operation #parry_delta vexp.math = @s vexp.damage_taken
scoreboard players operation #parry_delta vexp.math -= @s vexp.parry_damage_snapshot

# Mark the real attacker for this successful parry before running item-specific hooks.
execute if score #parry_delta vexp.math matches 1.. on attacker run tag @s add vexp.parried

#Trigger Parry Hook
execute if score #parry_delta vexp.math matches 1.. run function vexp:dungeons/combo_system/hooks/apply_parry_wrapper

scoreboard players remove @s vexp.parry_timer 1
