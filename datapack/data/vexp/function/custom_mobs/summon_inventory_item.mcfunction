# Summon a custom display item as Inventory Item
# @s is the custom mob
scoreboard players operation #cm_host_id vexp.math = @s vexp.id

#Summon temporary item display and mount it on the mob
$summon item_display ~ ~1 ~ {Tags:["vexp.custom_mob_display","vexp.custom_mob_inventory","vexp.temp_custom_mob_inventory"],item:$(item),billboard:"fixed",transformation:{left_rotation:[$(rx),$(ry),$(rz),1f],right_rotation:[0f,0f,0f,1f],translation:[$(x),$(y),$(z)],scale:[$(scale),$(scale),$(scale)]},teleport_duration:1,interpolation_duration:1,view_range:1.0f}

execute as @e[type=item_display,tag=vexp.temp_custom_mob_inventory,sort=nearest,distance=..2.5] run scoreboard players operation @s vexp.id = #cm_host_id vexp.math

execute as @e[type=item_display,tag=vexp.temp_custom_mob_inventory,sort=nearest,distance=..2.5] run ride @s mount @e[tag=vexp.custom_mob,sort=nearest,limit=1,distance=..1]
tag @e[type=item_display,tag=vexp.temp_custom_mob_inventory,sort=nearest,distance=..2.5] remove vexp.temp_custom_mob_inventory
