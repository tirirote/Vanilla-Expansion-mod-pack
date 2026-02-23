# 1. Assign ID if missing
execute unless score @s vexp.id = @s vexp.id run function vexp:utils/assign_id
execute store result score @s vexp.old_hp run data get entity @s Health

# 2. Summon Text Display linked to the mob and make it a passenger
tag @s add vexp.current_mob
# We use 'translation:[0f, 0.5f, 0f]' to lift the bar above the mob's head
summon text_display ~ ~ ~ {Tags:["vexp.health_bar","vexp.new_bar"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.25f,0f],scale:[1f,1f,1f]},billboard:"center",alignment:"center"}
ride @e[tag=vexp.new_bar,sort=nearest,limit=1] mount @s

# 3. Link ID and setup
execute as @e[tag=vexp.new_bar,distance=..2,sort=nearest,limit=1] run function vexp:mob_health/init_bar

# 4. Cleanup tags
tag @s add vexp.health_init
tag @s remove vexp.current_mob
tag @e[tag=vexp.new_bar,distance=..2,sort=nearest,limit=1] remove vexp.new_bar
