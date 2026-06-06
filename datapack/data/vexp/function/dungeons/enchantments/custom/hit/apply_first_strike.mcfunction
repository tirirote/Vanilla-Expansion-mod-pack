# First Strike I: bonus damage on the first hit of a combo.
# @s = attacker
# vexp.combo == 1 means this is the first hit of the current combo sequence.
execute if score @s vexp.combo matches 0 as @e[tag=vexp.hitted,distance=..8] run damage @s 3.0 vexp:combo_hit by @p[tag=vexp.attacker,limit=1]

#Feedback
execute if score @s vexp.combo matches 0 as @e[tag=vexp.hitted,distance=..8] at @s run function vexp:dungeons/fx/enchantments/first_strike
