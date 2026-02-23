# 1. Verification: Check if bar exists
execute unless data entity @s Passengers[{Tags:["vexp.health_bar"]}] run tag @s remove vexp.health_init
execute if entity @s[tag=!vexp.health_init] run function vexp:mob_health/init

# 2. Capture ID and Life (as the mob @s)
execute store result score @s vexp.hp run data get entity @s Health
execute store result score @s vexp.max_hp run attribute @s minecraft:max_health get
execute store result storage vexp:temp Bar.id int 1 run scoreboard players get @s vexp.id
execute store result storage vexp:temp Bar.hp int 1 run scoreboard players get @s vexp.hp
execute store result storage vexp:temp Bar.max int 1 run scoreboard players get @s vexp.max_hp

# 3. Damage Indicator Detection
scoreboard players operation #damage vexp.math = @s vexp.old_hp
scoreboard players operation #damage vexp.math -= @s vexp.hp
execute if score #damage vexp.math matches 1.. run function vexp:mob_health/spawn_damage
scoreboard players operation @s vexp.old_hp = @s vexp.hp

# 4. Color Calculation (Dynamic Green to Red)
scoreboard players set #100 vexp.math 100
scoreboard players operation #percent vexp.math = @s vexp.hp
scoreboard players operation #percent vexp.math *= #100 vexp.math
scoreboard players operation #percent vexp.math /= @s vexp.max_hp

data modify storage vexp:temp Bar.color set value "red"
execute if score #percent vexp.math matches 25..49 run data modify storage vexp:temp Bar.color set value "gold"
execute if score #percent vexp.math matches 50..74 run data modify storage vexp:temp Bar.color set value "yellow"
execute if score #percent vexp.math matches 75.. run data modify storage vexp:temp Bar.color set value "green"

# 5. Capture Name
data modify storage vexp:temp Bar.name set value {text:""}
execute if data entity @s CustomName run data modify storage vexp:temp Bar.name set from entity @s CustomName
execute unless data entity @s CustomName run function vexp:mob_health/set_name with storage vexp:temp Bar

# 6. Jump to the bar and apply it
execute on passengers if entity @s[tag=vexp.health_bar] run function vexp:mob_health/update_bar