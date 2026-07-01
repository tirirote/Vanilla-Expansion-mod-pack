#Mark host as a custom mob anchor
tag @s add vexp.custom_mob_host

$scoreboard players set #display_spin_rotation vexp.math $(spin_rotation)

scoreboard players operation #cm_host_id vexp.math = @s vexp.id

#Summon temporary item display and mount it on the mob
$execute unless score #display_spin_rotation vexp.math matches 1.. run summon item_display ~ ~1 ~ {Tags:["vexp.custom_mob_display"],item:{id:"minecraft:stone",count:1,components:{"minecraft:custom_model_data":{strings:["vexp:$(model)"]}}},billboard:"fixed",transformation:{left_rotation:[$(rx),$(ry),$(rz),1f],right_rotation:[0f,0f,0f,1f],translation:[$(x),$(y),$(z)],scale:[$(scale),$(scale),$(scale)]},brightness:{block:15,sky:15},teleport_duration:1,interpolation_duration:1,view_range:1.0f}

$execute if score #display_spin_rotation vexp.math matches 1.. run summon item_display ~ ~1 ~ {Tags:["vexp.custom_mob_display","vexp.custom_mob_spin_rotation"],item:{id:"minecraft:stone",count:1,components:{"minecraft:custom_model_data":{strings:["vexp:$(model)"]}}},billboard:"fixed",transformation:{left_rotation:[$(rx),$(ry),$(rz),1f],right_rotation:[0f,0f,0f,1f],translation:[$(x),$(y),$(z)],scale:[$(scale),$(scale),$(scale)]},brightness:{block:15,sky:15},teleport_duration:1,interpolation_duration:1,view_range:1.0f}

execute as @e[type=item_display,tag=vexp.custom_mob_display,sort=nearest,distance=..2.5] run scoreboard players operation @s vexp.id = #cm_host_id vexp.math

$execute as @e[type=item_display,tag=vexp.custom_mob_display,sort=nearest,distance=..2.5] unless data entity @s data.vexp.mob_display run data modify entity @s data.vexp.mob_display.spin_rotation set value $(spin_rotation)

execute as @e[type=item_display,tag=vexp.custom_mob_display,sort=nearest,distance=..2.5] run ride @s mount @e[tag=vexp.custom_mob_host,sort=nearest,limit=1,distance=..1]

tag @s remove vexp.custom_mob_host
