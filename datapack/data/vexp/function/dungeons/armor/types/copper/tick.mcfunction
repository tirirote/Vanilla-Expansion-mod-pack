# dungeons/armor/types/copper/tick.mcfunction
# Passive tick hook for armor type: copper
execute store result score @s vexp.armor_rand run random value -1000..1000
execute if score @s vexp.armor_rand matches -50..50 run particle instant_effect{color:16755873} ~ ~1 ~ 0.35 0.5 0.35 0 1
