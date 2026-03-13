# Dash left (A)
execute if block ^0.2 ^ ^ #minecraft:replaceable run scoreboard players set @s vexp.move_slide_dir 3
execute if block ^0.2 ^ ^ #minecraft:replaceable run scoreboard players set @s vexp.move_slide_ticks 5
execute if block ^0.2 ^ ^ #minecraft:replaceable run function vexp:movement/dash/end