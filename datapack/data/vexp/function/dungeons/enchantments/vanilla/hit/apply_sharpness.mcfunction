# Sharpness: +0.5*level + 0.5 al dano de melee.

execute if score #ench_sharp vexp.math matches 1 as @e[tag=vexp.hitted] run damage @s 1.0 vexp:combo_hit by @p[tag=vexp.attacker,limit=1]
execute if score #ench_sharp vexp.math matches 2 as @e[tag=vexp.hitted] run damage @s 1.5 vexp:combo_hit by @p[tag=vexp.attacker,limit=1]
execute if score #ench_sharp vexp.math matches 3 as @e[tag=vexp.hitted] run damage @s 2.0 vexp:combo_hit by @p[tag=vexp.attacker,limit=1]
execute if score #ench_sharp vexp.math matches 4 as @e[tag=vexp.hitted] run damage @s 2.5 vexp:combo_hit by @p[tag=vexp.attacker,limit=1]
execute if score #ench_sharp vexp.math matches 5.. as @e[tag=vexp.hitted] run damage @s 3.0 vexp:combo_hit by @p[tag=vexp.attacker,limit=1]

execute as @e[tag=vexp.hitted] at @s run function vexp:dungeons/fx/enchantments/sharpness
