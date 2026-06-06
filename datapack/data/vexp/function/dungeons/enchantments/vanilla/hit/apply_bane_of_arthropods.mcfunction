# Bane of Arthropods: dano extra a artropodos.

execute if score #ench_bane vexp.math matches 1 as @e[tag=vexp.hitted,type=#vexp:enchantment_bane_targets] run damage @s 2.5 vexp:combo_hit by @p[tag=vexp.attacker,limit=1]
execute if score #ench_bane vexp.math matches 2 as @e[tag=vexp.hitted,type=#vexp:enchantment_bane_targets] run damage @s 5.0 vexp:combo_hit by @p[tag=vexp.attacker,limit=1]
execute if score #ench_bane vexp.math matches 3 as @e[tag=vexp.hitted,type=#vexp:enchantment_bane_targets] run damage @s 7.5 vexp:combo_hit by @p[tag=vexp.attacker,limit=1]
execute if score #ench_bane vexp.math matches 4 as @e[tag=vexp.hitted,type=#vexp:enchantment_bane_targets] run damage @s 10.0 vexp:combo_hit by @p[tag=vexp.attacker,limit=1]
execute if score #ench_bane vexp.math matches 5.. as @e[tag=vexp.hitted,type=#vexp:enchantment_bane_targets] run damage @s 12.5 vexp:combo_hit by @p[tag=vexp.attacker,limit=1]

effect give @e[tag=vexp.hitted,type=#vexp:enchantment_bane_targets] slowness 5 1 true
execute as @e[tag=vexp.hitted,type=#vexp:enchantment_bane_targets] at @s run function vexp:dungeons/fx/enchantments/bane
