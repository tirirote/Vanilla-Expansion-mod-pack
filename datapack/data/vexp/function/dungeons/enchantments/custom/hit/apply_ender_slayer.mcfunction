# Ender Slayer I-V: bonus damage against End mobs (same scaling as Smite).
# @s = attacker
execute if score #ench_ender_slayer vexp.math matches 1 as @e[tag=vexp.hitted,type=#vexp:enchantment_ender_slayer_targets,distance=..8] run damage @s 2.5 vexp:combo_hit by @p[tag=vexp.attacker,limit=1]
execute if score #ench_ender_slayer vexp.math matches 2 as @e[tag=vexp.hitted,type=#vexp:enchantment_ender_slayer_targets,distance=..8] run damage @s 5.0 vexp:combo_hit by @p[tag=vexp.attacker,limit=1]
execute if score #ench_ender_slayer vexp.math matches 3 as @e[tag=vexp.hitted,type=#vexp:enchantment_ender_slayer_targets,distance=..8] run damage @s 7.5 vexp:combo_hit by @p[tag=vexp.attacker,limit=1]
execute if score #ench_ender_slayer vexp.math matches 4 as @e[tag=vexp.hitted,type=#vexp:enchantment_ender_slayer_targets,distance=..8] run damage @s 10.0 vexp:combo_hit by @p[tag=vexp.attacker,limit=1]
execute if score #ench_ender_slayer vexp.math matches 5 as @e[tag=vexp.hitted,type=#vexp:enchantment_ender_slayer_targets,distance=..8] run damage @s 12.5 vexp:combo_hit by @p[tag=vexp.attacker,limit=1]

effect give @e[tag=vexp.hitted,type=#vexp:enchantment_ender_slayer_targets,distance=..8] slowness 5 1 true
execute as @e[tag=vexp.hitted,type=#vexp:enchantment_ender_slayer_targets,distance=..8] at @s run function vexp:dungeons/fx/enchantments/bane
