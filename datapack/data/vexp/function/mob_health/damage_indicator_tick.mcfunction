# Tick for damage indicator

# Lifetime
execute if score @s vexp.timer matches ..0 run kill @s
scoreboard players remove @s vexp.timer 1

# Movement
tp @s ^ ^.05 ^.005 ~ ~25

# Custom Animation for crit text indicator
execute if entity @s[tag=vexp.damage_indicator_critical] if score @s vexp.timer matches 8..10 run data modify entity @s transformation.scale set value [1f,1f,1f]
execute if entity @s[tag=vexp.damage_indicator_critical] if score @s vexp.timer matches 4..7 run data modify entity @s transformation.scale set value [2.5f,2.5f,2.5f]
execute if entity @s[tag=vexp.damage_indicator_critical] if score @s vexp.timer matches 0..3 run data modify entity @s transformation.scale set value [0.5f,0.5f,0.5f]
