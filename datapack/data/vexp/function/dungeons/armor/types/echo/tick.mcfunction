# dungeons/armor/types/resonance/tick.mcfunction
# Passive tick hook for armor type: resonance
execute store result score @s vexp.armor_rand run random value -1000..1000
execute if score @s vexp.armor_rand matches -100..100 run particle sculk_charge_pop ~ ~1 ~ 0.35 0.5 0.35 0.02 1
