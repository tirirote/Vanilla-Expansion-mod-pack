# dungeons/combo_system/effects/apply_weakness.mcfunction
# @s is the player (attacker)
# Subtracts weakness penalty from #eff_dmg vexp.math (x10 scale)
# Vanilla formula: -(amplifier + 1) * 4 damage

execute store result score #weak_amp vexp.math run data get entity @s active_effects[{id:"minecraft:weakness"}].amplifier
scoreboard players add #weak_amp vexp.math 1
scoreboard players set #weak_mul vexp.math 40
scoreboard players operation #weak_mul vexp.math *= #weak_amp vexp.math
scoreboard players operation #eff_dmg vexp.math -= #weak_mul vexp.math
