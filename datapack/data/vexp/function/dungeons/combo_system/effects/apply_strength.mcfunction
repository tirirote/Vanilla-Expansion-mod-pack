# dungeons/combo_system/effects/apply_strength.mcfunction
# @s is the player (attacker)
# Adds strength bonus to #eff_dmg vexp.math (x10 scale)
# Vanilla formula: +(amplifier + 1) * 3 damage

execute store result score #str_amp vexp.math run data get entity @s active_effects[{id:"minecraft:strength"}].amplifier
scoreboard players add #str_amp vexp.math 1
scoreboard players set #str_mul vexp.math 30
scoreboard players operation #str_mul vexp.math *= #str_amp vexp.math
scoreboard players operation #eff_dmg vexp.math += #str_mul vexp.math
