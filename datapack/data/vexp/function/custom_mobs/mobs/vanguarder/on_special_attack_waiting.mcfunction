# Waiting for special attack
# @s is the custom mob
execute unless block ~ ~-1 ~ #air if block ^ ^ ^-1 #replaceable run tp @s ^ ^ ^-0.01 facing entity @p[limit=1]
particle dust_color_transition{from_color:8359329,to_color:5397865,scale:0.8} ~ ~1 ~ 0.2 0.2 0.2 1 1
