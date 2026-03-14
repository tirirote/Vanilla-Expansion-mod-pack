# Spawn two tornado markers linked to this player by vexp.id
execute unless score @s vexp.id matches 1.. run function vexp:utils/assign_id
scoreboard players operation #temp vexp.id = @s vexp.id

# Replace previous tornado markers from this owner
execute as @e[type=marker,tag=vexp.sword_tornado] if score @s vexp.id = #temp vexp.id run kill @s

# Marker A (clockwise)
summon marker ^ ^ ^1 {Tags:["vexp.sword_tornado","vexp.sword_tornado.cw","vexp.temp_tornado"],NoGravity:1b}

# Marker B (counter-clockwise, 180 phase)
summon marker ^ ^ ^-1 {Tags:["vexp.sword_tornado","vexp.sword_tornado.ccw","vexp.temp_tornado"],NoGravity:1b}

# Link markers to owner id and init local timer
execute as @e[type=marker,tag=vexp.temp_tornado,distance=..2] run scoreboard players operation @s vexp.id = #temp vexp.id
scoreboard players set @e[type=marker,tag=vexp.temp_tornado,distance=..2] vexp.anim_frame 0
tag @e[type=marker,tag=vexp.temp_tornado,distance=..2] remove vexp.temp_tornado
