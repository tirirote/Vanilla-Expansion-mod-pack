# First Strike I: bonus damage on the first hit of a combo.
# @s = attacker
# vexp.combo == 0 means this is the first hit of the current combo sequence.

# If not the first hit, skip
execute unless score @s vexp.combo matches 0 run return 0

# Get current damage and add +3.0 bonus (scale is 10)
scoreboard players set #first_strike_bonus vexp.math 0
execute store result score #first_strike_bonus vexp.math run data get storage vexp:dungeons.weapon combo_params.eff_damage 10
scoreboard players set #first_strike_val vexp.math 30
scoreboard players operation #first_strike_bonus vexp.math += #first_strike_val vexp.math
execute if score #first_strike_bonus vexp.math matches ..0 run scoreboard players set #first_strike_bonus vexp.math 1

execute store result storage vexp:temp first_strike_damage float 0.1 run scoreboard players get #first_strike_bonus vexp.math

execute as @e[tag=vexp.hitted,distance=..16,limit=1] run function vexp:dungeons/enchantments/custom/hit/first_strike_deal_bonus with storage vexp:temp

#Feedback
execute as @e[tag=vexp.hitted,distance=..16] at @s run function vexp:dungeons/fx/enchantments/first_strike
