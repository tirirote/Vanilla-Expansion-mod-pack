# Dash forward (W)
execute if block ^ ^ ^0.2 #minecraft:replaceable run scoreboard players set @s vexp.move_slide_dir 2
execute if block ^ ^ ^0.2 #minecraft:replaceable run scoreboard players set @s vexp.move_slide_ticks 5
execute if block ^ ^ ^0.2 #minecraft:replaceable run function vexp:movement/dash/end