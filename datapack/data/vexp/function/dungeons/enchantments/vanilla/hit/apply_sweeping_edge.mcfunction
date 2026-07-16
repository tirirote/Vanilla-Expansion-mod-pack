# Sweeping Edge I/II/III: extra area damage around the main hitted target.

scoreboard players set #sweep_pct vexp.math 50
execute if score #ench_sweep vexp.math matches 2 run scoreboard players set #sweep_pct vexp.math 67
execute if score #ench_sweep vexp.math matches 3.. run scoreboard players set #sweep_pct vexp.math 75

scoreboard players set #sweep_bonus vexp.math 0
execute store result score #sweep_bonus vexp.math run data get storage vexp:dungeons.weapon combo_params.eff_damage 10
scoreboard players operation #sweep_bonus vexp.math *= #sweep_pct vexp.math
scoreboard players set #const_100 vexp.math 100
scoreboard players operation #sweep_bonus vexp.math /= #const_100 vexp.math
execute if score #sweep_bonus vexp.math matches ..0 run return 0

execute store result storage vexp:temp sweep_damage float 0.1 run scoreboard players get #sweep_bonus vexp.math

# Cache owner ID for self-filter in target queries.
scoreboard players operation #combo_owner_id vexp.id = @s vexp.id

execute as @e[predicate=vexp:is_target,distance=..4.5] unless score @s vexp.id = #combo_owner_id vexp.id at @s run function vexp:dungeons/enchantments/vanilla/hit/sweeping_edge_deal_bonus with storage vexp:temp

#Feedback
function vexp:dungeons/fx/enchantments/sweeping_edge
