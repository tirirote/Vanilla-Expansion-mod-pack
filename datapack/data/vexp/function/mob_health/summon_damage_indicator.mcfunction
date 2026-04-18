# Summoning a floating damage indicator
# We use a random offset and motion to make it pop
$execute anchored eyes run summon text_display ~ ~1 ~ {Tags:["vexp.damage_indicator","vexp.new_damage_indicator"],text:{"text":"$(prefix)$(val)$(suffix)","color":"$(color)","bold":$(bold)},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]},billboard:"center",teleport_duration:2,interpolation_duration:2}

data modify entity @e[tag=vexp.new_damage_indicator,limit=1,sort=nearest] Rotation set from entity @s Rotation
execute if data storage vexp:temp Damage{critical:1b} run tag @e[tag=vexp.new_damage_indicator,limit=1,sort=nearest] add vexp.damage_indicator_critical
# Initialize its timer
execute as @e[tag=vexp.new_damage_indicator,limit=1,sort=nearest] run scoreboard players set @s vexp.timer 10
tag @e[tag=vexp.new_damage_indicator,limit=1,sort=nearest] remove vexp.new_damage_indicator
