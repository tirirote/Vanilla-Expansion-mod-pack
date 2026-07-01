$scoreboard players add @s vexp.math $(spin_rotation)
execute store result entity @s Rotation[0] float 1 run scoreboard players get @s vexp.math
