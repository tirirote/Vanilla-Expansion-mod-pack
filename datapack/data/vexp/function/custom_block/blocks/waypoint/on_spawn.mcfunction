# On spawn
# @s is the cutom block interaction

# Crea el text_display del waypoint y lo vincula por vexp.id.
# Si el item fue renombrado en yunque, usa ese nombre (CustomName).
summon text_display ~ ~1 ~ {Tags:["vexp.waypoint.name","vexp.waypoint.temp"],text:"Marcador",billboard:"center",alignment:"center",see_through:1b,background:0,shadow:1b,line_width:200}

execute as @e[type=text_display,tag=vexp.waypoint.temp,distance=..2,limit=1,sort=nearest] run scoreboard players operation @s vexp.id = #global vexp.id

#Reset previous storage
data remove storage vexp:custom_block waypoint_name

#Get Name
execute if data entity @s CustomName run data modify storage vexp:custom_block waypoint_name set from entity @s CustomName

execute if data storage vexp:custom_block waypoint_name as @e[type=text_display,tag=vexp.waypoint.temp,distance=..2,limit=1,sort=nearest] run data modify entity @s text set from storage vexp:custom_block waypoint_name
execute if data storage vexp:custom_block waypoint_name as @e[type=interaction,tag=vexp.custom_block.interact,distance=..2] if score @s vexp.id = #global vexp.id run data modify entity @s data.vexp.custom_name set from storage vexp:custom_block waypoint_name

#Cleanup
data remove storage vexp:custom_block waypoint_name
tag @e[type=text_display,tag=vexp.waypoint.temp,distance=..2] remove vexp.waypoint.temp
