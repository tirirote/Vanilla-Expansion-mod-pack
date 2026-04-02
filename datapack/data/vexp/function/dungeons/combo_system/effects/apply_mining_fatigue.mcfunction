# dungeons/combo_system/effects/apply_mining_fatigue.mcfunction
# @s is the player (attacker)
# Increases #eff_cd vexp.math (combo cooldown in ticks)
# Formula: +(amplifier + 1) * 3 ticks per level

execute store result score #fat_amp vexp.math run data get entity @s active_effects[{id:"minecraft:mining_fatigue"}].amplifier
scoreboard players add #fat_amp vexp.math 1
scoreboard players set #fat_mul vexp.math 3
scoreboard players operation #fat_mul vexp.math *= #fat_amp vexp.math
scoreboard players operation #eff_cd vexp.math += #fat_mul vexp.math
