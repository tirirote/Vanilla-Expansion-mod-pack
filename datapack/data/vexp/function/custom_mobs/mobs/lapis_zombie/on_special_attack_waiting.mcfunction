#Waiting for attack
execute unless block ~ ~-0.25 ~ #air positioned ~ ~1.5 ~ if block ^ ^ ^-0.05 #replaceable positioned ~ ~-1.495 ~ run tp @s ^ ^ ^-0.05 facing entity @p[limit=1] feet
#Feedback
particle instant_effect{color:1668607} ~ ~1 ~ 0.35 0.35 0.35 0 1
