# Movement Tick - Dash module

# Dash cooldown and tap windows
execute as @a[scores={vexp.move_dash_cd=1..}] run scoreboard players remove @s vexp.move_dash_cd 1
execute as @a[scores={vexp.move_tap_w=1..}] run scoreboard players remove @s vexp.move_tap_w 1
execute as @a[scores={vexp.move_tap_a=1..}] run scoreboard players remove @s vexp.move_tap_a 1
execute as @a[scores={vexp.move_tap_s=1..}] run scoreboard players remove @s vexp.move_tap_s 1
execute as @a[scores={vexp.move_tap_d=1..}] run scoreboard players remove @s vexp.move_tap_d 1

# Dash by double-tap (edge press + window)
# W
execute as @a if predicate vexp:input_forward if score @s vexp.move_prev_w matches 0 unless score @s vexp.move_dash_cd matches 1.. if score @s vexp.move_tap_w matches 1.. at @s run function vexp:movement/dash/forward
execute as @a if predicate vexp:input_forward if score @s vexp.move_prev_w matches 0 run scoreboard players set @s vexp.move_tap_w 7

# A
execute as @a if predicate vexp:input_left if score @s vexp.move_prev_a matches 0 unless score @s vexp.move_dash_cd matches 1.. if score @s vexp.move_tap_a matches 1.. at @s run function vexp:movement/dash/left
execute as @a if predicate vexp:input_left if score @s vexp.move_prev_a matches 0 run scoreboard players set @s vexp.move_tap_a 7

# S
execute as @a if predicate vexp:input_backward if score @s vexp.move_prev_s matches 0 unless score @s vexp.move_dash_cd matches 1.. if score @s vexp.move_tap_s matches 1.. at @s run function vexp:movement/dash/backward
execute as @a if predicate vexp:input_backward if score @s vexp.move_prev_s matches 0 run scoreboard players set @s vexp.move_tap_s 7

# D
execute as @a if predicate vexp:input_right if score @s vexp.move_prev_d matches 0 unless score @s vexp.move_dash_cd matches 1.. if score @s vexp.move_tap_d matches 1.. at @s run function vexp:movement/dash/right
execute as @a if predicate vexp:input_right if score @s vexp.move_prev_d matches 0 run scoreboard players set @s vexp.move_tap_d 7

# Dash slide (0.2 blocks/tick for 5 ticks)
execute as @a[scores={vexp.move_slide_ticks=1..,vexp.move_slide_dir=1}] at @s if block ^ ^ ^0.2 #minecraft:replaceable run tp @s ^ ^ ^0.2
execute as @a[scores={vexp.move_slide_ticks=1..,vexp.move_slide_dir=2}] at @s if block ^ ^ ^-0.2 #minecraft:replaceable run tp @s ^ ^ ^-0.2
execute as @a[scores={vexp.move_slide_ticks=1..,vexp.move_slide_dir=3}] at @s if block ^0.2 ^ ^ #minecraft:replaceable run tp @s ^0.2 ^ ^
execute as @a[scores={vexp.move_slide_ticks=1..,vexp.move_slide_dir=4}] at @s if block ^-0.2 ^ ^ #minecraft:replaceable run tp @s ^-0.2 ^ ^
execute as @a[scores={vexp.move_slide_ticks=1..}] run scoreboard players remove @s vexp.move_slide_ticks 1
