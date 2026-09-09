# dungeons/armor/types/bone/tick.mcfunction
# Triggered every tick while the armor system runs.
execute store result score @s vexp.armor_rand run random value -1000..1000
execute if score @s vexp.armor_rand matches -50..50 run particle effect{color:13620916} ~ ~1 ~ 0.35 0.5 0.35 0 1

tag @s add vexp.bone_armor_owner
# Friends with hostile via teams
team join vexp.bone_armor_friend
execute as @e[type=#vexp:can_become_angry,distance=..32] unless entity @s[tag=vexp.bone_modifier] at @s run function vexp:dungeons/armor/types/bone/target_modifier with entity @p[tag=vexp.bone_armor_owner,limit=1]
execute as @e[type=#vexp:bone_armor_friends,distance=..32] unless entity @s[tag=vexp.bone_modifier] at @s run function vexp:dungeons/armor/types/bone/target_modifier with entity @p[tag=vexp.bone_armor_owner,limit=1]
tag @s remove vexp.bone_armor_owner
