# dungeons/combo_system/effects/apply_haste.mcfunction
# @s is the player (attacker)
# Reduces #eff_cd vexp.math (combo cooldown in ticks)
# Formula: -(amplifier + 1) * 2 ticks per level

execute store result score #haste_amp vexp.math run data get entity @s active_effects[{id:"minecraft:haste"}].amplifier
scoreboard players add #haste_amp vexp.math 1
scoreboard players set #haste_mul vexp.math 2
scoreboard players operation #haste_mul vexp.math *= #haste_amp vexp.math
scoreboard players operation #eff_cd vexp.math -= #haste_mul vexp.math
