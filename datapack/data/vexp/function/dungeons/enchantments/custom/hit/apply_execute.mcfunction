# Execute I/II: bonus damage against targets below 50% HP.
# @s = attacker

# Calculate execute damage bonus (+2.0 per level: level 1 = +2.0, level 2 = +4.0)
scoreboard players set #execute_bonus_dmg vexp.math 20
execute if score @s vexp.enchant.execute matches 2.. run scoreboard players set #execute_bonus_dmg vexp.math 40

scoreboard players set #execute_bonus vexp.math 0
execute store result score #execute_bonus vexp.math run data get storage vexp:dungeons.weapon combo_params.eff_damage 10
scoreboard players operation #execute_bonus vexp.math += #execute_bonus_dmg vexp.math
execute if score #execute_bonus vexp.math matches ..0 run scoreboard players set #execute_bonus vexp.math 1

execute store result storage vexp:temp execute_damage float 0.1 run scoreboard players get #execute_bonus vexp.math

# Run check on all hit targets
execute as @e[tag=vexp.hitted,distance=..8] run function vexp:dungeons/enchantments/custom/hit/execute_try

# Feedback
execute as @e[tag=vexp.hitted,distance=..8] at @s run function vexp:dungeons/fx/enchantments/execute
function vexp:utils/sound {sound: "minecraft:entity.ravager.step", type: "player", pitch:1}
