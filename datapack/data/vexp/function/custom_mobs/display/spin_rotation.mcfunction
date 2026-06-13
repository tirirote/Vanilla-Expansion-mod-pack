$scoreboard players add #display_spin_rotation vexp.math $(spin_rotation)

execute unless data storage vexp:custom_mob_display Rotation run data merge storage vexp:custom_mob_display {Rotation:[0f,0f]}

execute store result storage vexp:custom_mob_display Rotation[0] float 1 run scoreboard players get #display_spin_rotation vexp.math

data modify entity @s Rotation set from storage vexp:custom_mob_display Rotation
