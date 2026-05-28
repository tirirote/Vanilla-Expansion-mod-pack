# Committed I/II: bonus damage vs targets already damaged before.
# Bonus: I = 7%, II = 15% of current combo eff_damage.

scoreboard players set #committed_pct vexp.math 7
execute if score #ench_committed vexp.math matches 2.. run scoreboard players set #committed_pct vexp.math 15

scoreboard players set #committed_bonus vexp.math 0
execute store result score #committed_bonus vexp.math run data get storage vexp:dungeons.weapon combo_params.eff_damage 10
scoreboard players operation #committed_bonus vexp.math *= #committed_pct vexp.math
scoreboard players set #const_100 vexp.math 100
scoreboard players operation #committed_bonus vexp.math /= #const_100 vexp.math
execute if score #committed_bonus vexp.math matches ..0 run scoreboard players set #committed_bonus vexp.math 1

execute store result storage vexp:temp committed_damage float 0.1 run scoreboard players get #committed_bonus vexp.math
execute as @e[tag=vexp.hitted,tag=vexp.committed_mark,distance=..8] at @s run function vexp:dungeons/enchantments/custom/hit/committed_deal_bonus with storage vexp:temp

# Mark current victims so next hits can trigger Committed.
tag @e[tag=vexp.hitted,distance=..8] add vexp.committed_mark
