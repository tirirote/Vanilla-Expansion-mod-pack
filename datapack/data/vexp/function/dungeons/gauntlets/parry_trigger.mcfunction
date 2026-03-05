# dungeons/gauntlets/parry_trigger.mcfunction
# @s is the mob being parried

# Knockback the mob
function vexp:utils/motion/apply_knockback {strength:2.5, y:0.5}

# Visual feedback for player
execute as @p[tag=vexp.gauntlets.parry,limit=1,distance=..3] run playsound minecraft:item.shield.block player @a ~ ~ ~ 1 0.5
execute as @p[tag=vexp.gauntlets.parry,limit=1,distance=..3] run particle minecraft:explosion ~ ~1.2 ~ 0.2 0.2 0.2 0.05 1

# Optional: Disable parry after trigger
execute as @p[tag=vexp.gauntlets.parry,limit=1,distance=..3] run tag @s remove vexp.gauntlets.parry
execute as @p[tag=vexp.gauntlets.parry,limit=1,distance=..3] run scoreboard players set @s vexp.dummy 0
