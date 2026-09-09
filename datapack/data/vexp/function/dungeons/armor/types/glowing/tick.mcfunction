# dungeons/armor/types/glowing/tick.mcfunction
# Triggered every tick while the armor system runs.
execute store result score @s vexp.armor_rand run random value -1000..1000
execute if score @s vexp.armor_rand matches -50..50 run particle instant_effect{color:1334358} ~ ~1 ~ 0.35 0.5 0.35 0 1

execute if entity @s[tag=vexp.glow_buffed] as @e[predicate=vexp:is_target,distance=..2.5] unless entity @s[tag=vexp.glow_marked] unless entity @s[tag=vexp.glow_buffed] unless entity @s[tag=vexp.armor_equip] at @s run function vexp:dungeons/armor/types/glowing/mark_target
execute if entity @s[tag=vexp.glow_buffed] run scoreboard players set @s vexp.dstate 1
