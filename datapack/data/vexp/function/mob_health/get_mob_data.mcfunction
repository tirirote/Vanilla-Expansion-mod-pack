# Executed as the mob from the bar via 'on vehicle'
# Since we are @s, these operations are extremely fast

# Name
execute if data entity @s CustomName run data modify storage vexp:temp Bar.name set from entity @s CustomName
execute unless data entity @s CustomName run data modify storage vexp:temp Bar.name set value {selector:"@s"}

# Health values
execute store result storage vexp:temp Bar.hp int 1 run data get entity @s Health
execute store result storage vexp:temp Bar.max int 1 run attribute @s minecraft:max_health get
