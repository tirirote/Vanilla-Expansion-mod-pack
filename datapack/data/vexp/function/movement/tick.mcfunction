# Movement Tick
# 0. Initialize scores for players (only if first run)
execute as @a unless score @s vexp.move_dash_cd = @s vexp.move_dash_cd run scoreboard players set @s vexp.move_dash_cd 0
execute as @a unless score @s vexp.move_climb_cd = @s vexp.move_climb_cd run scoreboard players set @s vexp.move_climb_cd 0
execute as @a unless score @s vexp.move_tap_w = @s vexp.move_tap_w run scoreboard players set @s vexp.move_tap_w 0
execute as @a unless score @s vexp.move_tap_a = @s vexp.move_tap_a run scoreboard players set @s vexp.move_tap_a 0
execute as @a unless score @s vexp.move_tap_s = @s vexp.move_tap_s run scoreboard players set @s vexp.move_tap_s 0
execute as @a unless score @s vexp.move_tap_d = @s vexp.move_tap_d run scoreboard players set @s vexp.move_tap_d 0
execute as @a unless score @s vexp.move_prev_w = @s vexp.move_prev_w run scoreboard players set @s vexp.move_prev_w 0
execute as @a unless score @s vexp.move_prev_a = @s vexp.move_prev_a run scoreboard players set @s vexp.move_prev_a 0
execute as @a unless score @s vexp.move_prev_s = @s vexp.move_prev_s run scoreboard players set @s vexp.move_prev_s 0
execute as @a unless score @s vexp.move_prev_d = @s vexp.move_prev_d run scoreboard players set @s vexp.move_prev_d 0
execute as @a unless score @s vexp.move_prev_sneak = @s vexp.move_prev_sneak run scoreboard players set @s vexp.move_prev_sneak 0
execute as @a unless score @s vexp.move_slide_ticks = @s vexp.move_slide_ticks run scoreboard players set @s vexp.move_slide_ticks 0
execute as @a unless score @s vexp.move_slide_dir = @s vexp.move_slide_dir run scoreboard players set @s vexp.move_slide_dir 0
execute as @a unless score @s vexp.move_climb_ready = @s vexp.move_climb_ready run scoreboard players set @s vexp.move_climb_ready 0

# 1. Dash logic
function vexp:movement/tick_dash

# 2. Climb logic
function vexp:movement/tick_climb

# 3. Persist key states for edge detection
scoreboard players set @a vexp.move_prev_w 0
scoreboard players set @a vexp.move_prev_a 0
scoreboard players set @a vexp.move_prev_s 0
scoreboard players set @a vexp.move_prev_d 0
execute as @a if predicate vexp:input_forward run scoreboard players set @s vexp.move_prev_w 1
execute as @a if predicate vexp:input_left run scoreboard players set @s vexp.move_prev_a 1
execute as @a if predicate vexp:input_backward run scoreboard players set @s vexp.move_prev_s 1
execute as @a if predicate vexp:input_right run scoreboard players set @s vexp.move_prev_d 1
scoreboard players set @a vexp.move_prev_sneak 0
execute as @a if predicate vexp:is_sneaking run scoreboard players set @s vexp.move_prev_sneak 1
