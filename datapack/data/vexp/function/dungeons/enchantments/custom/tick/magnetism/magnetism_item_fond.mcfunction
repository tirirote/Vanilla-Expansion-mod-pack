
# Slowly bring the items closer
data remove entity @s Motion
execute at @s facing entity @p[tag=vexp.enchantment_magnetism] feet run tp @s ^ ^ ^0.1

# Feedback
execute unless data entity @s Glowing run data modify entity @s Glowing set value true
team join vexp.blue
particle instant_effect{color:5057508,power:1} ~ ~ ~ 0 0 0 1 1
