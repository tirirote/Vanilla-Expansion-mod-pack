# Wildness I/II: speed buff + bonus finisher damage + cooldown reduction.
# Bonus damage: 15% / 30% of current combo eff_damage.

scoreboard players set #wild_pct vexp.math 15
execute if score #ench_wildness vexp.math matches 2.. run scoreboard players set #wild_pct vexp.math 30

scoreboard players set #wild_bonus vexp.math 0
execute store result score #wild_bonus vexp.math run data get storage vexp:dungeons.weapon combo_params.eff_damage 10
scoreboard players operation #wild_bonus vexp.math *= #wild_pct vexp.math
scoreboard players set #const_100 vexp.math 100
scoreboard players operation #wild_bonus vexp.math /= #const_100 vexp.math
execute if score #wild_bonus vexp.math matches ..0 run scoreboard players set #wild_bonus vexp.math 1

execute store result storage vexp:temp wildness_damage float 0.1 run scoreboard players get #wild_bonus vexp.math
execute as @e[tag=vexp.hitted,distance=..8] at @s run function vexp:dungeons/enchantments/custom/combo_end/wildness_deal_bonus with storage vexp:temp

execute if score #ench_wildness vexp.math matches 1 run effect give @s minecraft:speed 3 0 true
execute if score #ench_wildness vexp.math matches 2.. run effect give @s minecraft:speed 3 1 true

execute if score #ench_wildness vexp.math matches 1 run scoreboard players remove @s vexp.combo_cooldown 2
execute if score #ench_wildness vexp.math matches 2.. run scoreboard players remove @s vexp.combo_cooldown 4
execute if score @s vexp.combo_cooldown matches ..-1 run scoreboard players set @s vexp.combo_cooldown 0
