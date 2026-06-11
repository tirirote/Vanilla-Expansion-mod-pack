# Executed as the mob from the bar via 'on vehicle'
# Since we are @s, these operations are extremely fast

# Name
function vexp:mob_health/set_name with storage vexp:temp Bar

# Health values
execute store result storage vexp:temp Bar.hp int 1 run data get entity @s Health
execute store result storage vexp:temp Bar.max int 1 run attribute @s minecraft:max_health get
