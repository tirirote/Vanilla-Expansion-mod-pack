# When mob succesfully pickup item

# 1. Pickup item
data modify entity @s equipment.mainhand set from entity @e[type=item,sort=nearest,limit=1,distance=..1.5,tag=vexp.mob_favorite_item_found] Item

#2. Summon inventory display item
$data modify storage vexp:temp mob_inventory_display merge value {item:{id:"minecraft:stone",count:1}, x:$(item_pos_x), y:$(item_pos_y), z:$(item_pos_z), rx:$(item_rx), ry:0.0f, rz:0.0f, scale:0.7f}
data modify storage vexp:temp mob_inventory_display.item set from entity @s equipment.mainhand
execute if entity @s[type=#vexp:cannot_hold_items] run function vexp:custom_mobs/summon_inventory_item with storage vexp:temp mob_inventory_display

# 3. Remove tag
tag @s remove vexp.mob_trying_to_pickup
tag @s remove vexp.mob_aggro

# Sound
function vexp:utils/sound {sound: "minecraft:entity.item.pickup", type: "player", pitch:1}

# Kill item
kill @e[type=item,sort=nearest,limit=1,tag=vexp.mob_favorite_item_found,distance=..1.5]
