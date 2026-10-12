# When surrounded by mobs the mirror grants invisibility and removes aggro from mobs
tag @s add vexp.mirror_owner

# Count candidate mob
execute unless entity @s[nbt={active_effects:[{id:"minecraft:invisibility"}]}] as @e[predicate=vexp:is_target,type=!player,tag=!vexp.custom_block.dummy_mob,distance=..6] unless entity @s[tag=vexp.mirror_mob_marked] at @s run function vexp:artifacts/activate/mirror/count_mob
execute unless entity @s[nbt={active_effects:[{id:"minecraft:invisibility"}]}] if score @s vexp.mirror_mob_count matches 6.. run function vexp:artifacts/activate/mirror

tag @s remove vexp.mirror_owner
