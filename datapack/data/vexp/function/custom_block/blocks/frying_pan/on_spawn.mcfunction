# On spawn
# @s is the cutom block interaction

# Inicializa estado de coccion al colocar una sarten nueva
data modify entity @s data.vexp.cook_time set value 0
scoreboard players set @s vexp.cook_time 0
