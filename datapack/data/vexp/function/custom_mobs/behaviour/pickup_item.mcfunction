# When mob succesfully pickup item

# 1. Pickup item
data modify entity @s equipment.mainhand set from entity @e[type=item,sort=nearest,limit=1,distance=..2.5] Item

#2. Summon inventory display item
$data modify storage vexp:temp mob_inventory_display merge value {item:{id:"minecraft:stone",count:1}, x:$(item_pos_x), y:$(item_pos_y), z:$(item_pos_z), rx:$(item_rx), ry:0.0f, rz:0.0f, scale:0.7f}
data modify storage vexp:temp mob_inventory_display.item set from entity @s equipment.mainhand
function vexp:custom_mobs/summon_inventory_item with storage vexp:temp mob_inventory_display

# 3. Sound
function vexp:utils/sound {sound: "minecraft:entity.item.pickup", type: "player"}

# Kill item
kill @e[type=item,sort=nearest,limit=1,distance=..2.5]
