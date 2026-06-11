#Waiting for attack
execute unless block ~ ~-0.5 ~ #air if block ^ ^ ^-0.25 #replaceable run tp @s ^ ^ ^-0.25 facing entity @p eyes

#Feedback
particle item_cobweb ~ ~ ~ 0.35 0.1 0.35 0.1 1
