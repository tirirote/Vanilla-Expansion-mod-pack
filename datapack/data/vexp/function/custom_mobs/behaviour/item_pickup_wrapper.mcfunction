# Custom item pickup wrapper
# @s is the mob

#Detect favorite item on ground
# 1. Tag candidate item
$execute as @e[type=item,sort=nearest,distance=1..16,tag=!vexp.temp_mob_drop_item,nbt=!{Age:1s},nbt={OnGround:1b},nbt={Item:{count:1}}] unless entity @s[tag=vexp.mob_favorite_item_found] if items entity @s contents $(favorite_items) run tag @s add vexp.mob_favorite_item_found

execute if entity @e[tag=vexp.mob_favorite_item_found,sort=nearest,limit=1,distance=1..16] run tag @s add vexp.mob_trying_to_pickup
execute unless entity @e[tag=vexp.mob_favorite_item_found,sort=nearest,limit=1,distance=1..16] run tag @s remove vexp.mob_trying_to_pickup

# Move towards target
$execute if entity @e[tag=vexp.mob_favorite_item_found,sort=nearest,limit=1,distance=1..16] run function vexp:custom_mobs/helpers/try_pathfinding {speed: $(speed), target_tag:"vexp.mob_favorite_item_found"}

# 3. Custom on pickup try hook
$execute if items entity @e[tag=vexp.mob_favorite_item_found,sort=nearest,limit=1] contents $(favorite_items) run function vexp:custom_mobs/mobs/$(type)/on_pickup_try

# 4. Try pickup when in range
$execute if items entity @e[type=item,distance=..1,tag=vexp.mob_favorite_item_found,sort=nearest,limit=1] contents $(favorite_items) run function vexp:custom_mobs/behaviour/pickup_item with entity @s data.vexp.mob

# Detect player with fav item in hand
# Tag candidate player
$execute unless entity @s[tag=vexp.mob_trying_to_pickup] as @p[tag=vexp.mob_target] if entity @s[tag=vexp.mob_player_with_fav_item] unless items entity @s weapon.mainhand $(favorite_items) run tag @s remove vexp.mob_player_with_fav_item

$execute unless entity @s[tag=vexp.mob_trying_to_pickup] as @p[tag=vexp.mob_target] unless entity @s[tag=vexp.mob_player_with_fav_item] if items entity @s weapon.mainhand $(favorite_items) run tag @s add vexp.mob_player_with_fav_item

# Follow player with fav item (when not trying to pickup)
$execute unless entity @s[tag=vexp.mob_trying_to_pickup] if entity @p[tag=vexp.mob_player_with_fav_item,limit=1,distance=1.5..16] run function vexp:custom_mobs/helpers/try_pathfinding {speed: $(speed), target_tag:"vexp.mob_player_with_fav_item"}

# Remove player tag if is trying to pickup an item in the ground
execute if entity @s[tag=vexp.mob_trying_to_pickup] as @p[tag=vexp.mob_player_with_fav_item] run tag @s remove vexp.mob_player_with_fav_item
