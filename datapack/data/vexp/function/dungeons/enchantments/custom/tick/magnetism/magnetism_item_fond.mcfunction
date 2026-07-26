
# Slowly bring the items closer
data remove entity @s Motion

execute unless data entity @s teleport_duration run data modify entity @s teleport_duration set value 1
execute at @s facing entity @p[tag=vexp.enchantment_magnetism] feet run tp @s ^ ^ ^0.05

execute unless data entity @s Glowing run data modify entity @s Glowing set value true
team join vexp.blue

# Feedback
particle entity_effect{color:2085838591} ~ ~ ~ 0 0 0 0 0
