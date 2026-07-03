# Custom item pickup wrapper

# 1. Tag candidate item
$execute as @e[type=item,distance=..8,tag=!vexp.temp_mob_drop_item,nbt=!{Age:1s},nbt={OnGround:1b},nbt={Item:{count:1}},limit=1] unless entity @s[tag=vexp.mob_favorite_item_found] if items entity @s contents $(favorite_items) run tag @s add vexp.mob_favorite_item_found

# 2. Move towards item
execute unless block ~ ~-1 ~ #air if block ^ ^0.5 ^0.5 #replaceable run tp @s ^ ^ ^0.3 facing entity @e[type=item,tag=vexp.mob_favorite_item_found,sort=nearest,limit=1]

execute if block ~ ~-1 ~ #air if block ^ ^0.5 ^0.5 #replaceable run tp @s ^ ^-0.5 ^0.3 facing entity @e[type=item,tag=vexp.mob_favorite_item_found,sort=nearest,limit=1]

# 3. Custom on pickup try hook
$execute if items entity @e[type=item,distance=1.5..8,tag=vexp.mob_favorite_item_found,limit=1] contents $(favorite_items) run function vexp:custom_mobs/mobs/$(type)/on_pickup_try

# 4. Try pickup when in range
$execute if items entity @e[type=item,distance=..1.5,tag=vexp.mob_favorite_item_found,limit=1] contents $(favorite_items) run function vexp:custom_mobs/behaviour/pickup_item with entity @s data.vexp.mob
