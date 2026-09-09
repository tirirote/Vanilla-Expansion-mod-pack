# dungeons/armor/types/gold/tick.mcfunction
execute store result score @s vexp.armor_rand run random value -1000..1000
execute if score @s vexp.armor_rand matches -50..50 run particle instant_effect{color:8322974} ~ ~1 ~ 0.35 0.5 0.35 0 1

# Chance of getting luck
execute if score @s vexp.armor_rand matches -2..2 run function vexp:dungeons/armor/types/emerald/luck

# Buff illagers
execute as @e[type=#minecraft:illager] run function vexp:dungeons/armor/types/emerald/illagers_mod
