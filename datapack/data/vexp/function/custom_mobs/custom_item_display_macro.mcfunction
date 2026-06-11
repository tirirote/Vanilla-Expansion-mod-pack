#Mark host as a custom mob anchor
tag @s add vexp.custom_mob_host

$scoreboard players set #display_spin_rotation vexp.math $(spin_rotation)

#Summon temporary item display and mount it on the mob
$execute unless score #display_spin_rotation vexp.math matches 1.. unless data entity @s Passengers[{Tags:["vexp.custom_mob_display"]}] run summon item_display ~ ~1 ~ {Tags:["vexp.custom_mob_display"],item:{id:"minecraft:stone",count:1,components:{"minecraft:custom_model_data":{strings:["vexp:$(model)"]}}},billboard:"fixed",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[$(x),$(y),$(z)],scale:[$(scale),$(scale),$(scale)]},brightness:{block:15,sky:15},teleport_duration:1,interpolation_duration:1,view_range:1.0f}

$execute if score #display_spin_rotation vexp.math matches 1.. unless data entity @s Passengers[{Tags:["vexp.custom_mob_display"]}] run summon item_display ~ ~1 ~ {Tags:["vexp.custom_mob_display","vexp.custom_mob_spin_rotation"],item:{id:"minecraft:stone",count:1,components:{"minecraft:custom_model_data":{strings:["vexp:$(model)"]}}},billboard:"fixed",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[$(x),$(y),$(z)],scale:[$(scale),$(scale),$(scale)]},brightness:{block:15,sky:15},teleport_duration:1,interpolation_duration:1,view_range:1.0f}

scoreboard players operation @e[type=item_display,tag=vexp.custom_mob_display,sort=nearest,limit=1,distance=..2.5] vexp.id = @s vexp.id

$data modify entity @e[type=item_display,tag=vexp.custom_mob_display,sort=nearest,limit=1,distance=..2.5] data set value {vexp:{mob_display:{spin_rotation:$(spin_rotation)}}}

execute unless data entity @s Passengers[{Tags:["vexp.custom_mob_display"]}] run ride @e[type=item_display,tag=vexp.custom_mob_display,sort=nearest,limit=1,distance=..2.5] mount @s

#kill @e[type=item_display,tag=vexp.custom_mob_display_temp,sort=nearest,limit=1,distance=..2]

