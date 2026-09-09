# dungeons/armor/types/leather/tick.mcfunction
execute store result score @s vexp.armor_rand run random value -1000..1000
execute if score @s vexp.armor_rand matches -50..50 run particle effect{color:12098185} ~ ~1 ~ 0.35 0.5 0.35 0 1

# Random chance to found an item
execute if score @s vexp.armor_rand matches -100..100 as @e[type=item,distance=..6,nbt={Age:1s}] unless entity @s[tag=vexp.leather_found] unless data entity @s Thrower if items entity @s contents #vexp:brusheable at @s run function vexp:dungeons/armor/types/leather/extra_loot
