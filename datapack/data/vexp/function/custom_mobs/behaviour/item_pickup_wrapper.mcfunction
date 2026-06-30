# Custom item pickup wrapper
$scoreboard players set @s vexp.mob_can_pickup $(can_pickup_item)

# 1. Custom on pickup try hook
$execute if score @s vexp.mob_can_pickup matches 1.. if items entity @e[type=item,distance=2.5..16,nbt={OnGround:1b},tag=!vexp.temp_mob_drop_item,nbt=!{Age:1s}] contents $(favorite_items) run function vexp:custom_mobs/mobs/$(type)/on_pickup_try

# 2. Try pickup when in range
$execute if score @s vexp.mob_can_pickup matches 1.. if items entity @e[type=item,distance=1.5..2.5,nbt={OnGround:1b},tag=!vexp.temp_mob_drop_item,nbt=!{Age:1s}] contents $(favorite_items) run function vexp:custom_mobs/behaviour/pickup_item with entity @s data.vexp.mob
