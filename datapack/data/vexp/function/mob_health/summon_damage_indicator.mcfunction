# Summoning a floating damage indicator
# We use a random offset and motion to make it pop
$summon text_display ~ ~1.5 ~ {Tags:["vexp.damage_indicator"],text:{"text":"-$(val)","color":"red","bold":true},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]},billboard:"center",teleport_duration:1,interpolation_duration:1}

data modify entity @e[tag=vexp.damage_indicator,limit=1,sort=nearest] Rotation set from entity @s Rotation
# Initialize its timer
execute as @e[tag=vexp.damage_indicator,limit=1,sort=nearest] run scoreboard players set @s vexp.timer 10
