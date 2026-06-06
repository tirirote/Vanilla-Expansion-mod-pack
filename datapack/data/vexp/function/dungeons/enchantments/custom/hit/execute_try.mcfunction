# Execute HP check: @s = target entity
# Check if current HP is below 50% of max HP.
# We scale both values by 2 to avoid float division.
# Condition: Health * 2 <= MaxHealth  (i.e. Health <= MaxHealth / 2)

scoreboard players set #exec_max vexp.math 0
execute store result score #exec_max vexp.math run attribute @s minecraft:max_health get 2

scoreboard players set #exec_cur vexp.math 0
execute store result score #exec_cur vexp.math run data get entity @s Health 2

scoreboard players set #exec_2 vexp.math 2
scoreboard players operation #exec_doubled vexp.math = #exec_cur vexp.math
scoreboard players operation #exec_doubled vexp.math *= #exec_2 vexp.math

# If target is NOT below 50% HP, stop
execute unless score #exec_doubled vexp.math <= #exec_max vexp.math run return 0

# Apply bonus damage: +2.0 per Execute level
damage @s 2.0 vexp:combo_hit by @p[tag=vexp.attacker,limit=1]
execute if score #ench_execute vexp.math matches 2.. run damage @s 2.0 vexp:combo_hit by @p[tag=vexp.attacker,limit=1]

