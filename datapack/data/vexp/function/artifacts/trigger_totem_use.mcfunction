# Get current hp
execute store result score @s vexp.player_hp run data get entity @s Health 1

# Deal fatal damage
damage @s 99999999999999999999999999999999999999 minecraft:generic_kill

# Heal back
execute if score @s vexp.player_hp matches ..2 run effect give @s instant_health 1 0 true
execute if score @s vexp.player_hp matches ..4 run effect give @s instant_health 1 1 true
execute if score @s vexp.player_hp matches ..8 run effect give @s instant_health 1 2 true
execute if score @s vexp.player_hp matches ..16 run effect give @s instant_health 1 3 true
execute if score @s vexp.player_hp matches ..32 run effect give @s instant_health 1 4 true
