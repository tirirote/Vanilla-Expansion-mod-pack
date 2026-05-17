# Se ejecuta AS la interaction de la sarten
# Refresca el visual del item que esta dentro
function vexp:custom_block/blocks/frying_pan/clear_item_visual

scoreboard players operation #temp vexp.id = @s vexp.id
data remove storage vexp:custom_block frying_pan_visual_item
execute if data entity @s data.vexp.pan_item run data modify storage vexp:custom_block frying_pan_visual_item set from entity @s data.vexp.pan_item

execute if data entity @s data.vexp.pan_item at @s run summon item_display ~ ~ ~ {Tags:["vexp.frying_pan.item","vexp.frying_pan.new"],item:{id:"minecraft:stone",count:1},transformation:{translation:[0f,0.09f,0f],scale:[0.75f,0.75f,0.75f],left_rotation:[1f,0f,0f,1f],right_rotation:[0f,0f,0f,1f]},teleport_duration:1,interpolation_duration:1}
execute if data storage vexp:custom_block frying_pan_visual_item as @e[type=item_display,tag=vexp.frying_pan.new,sort=nearest,limit=1,distance=..1] run scoreboard players operation @s vexp.id = #temp vexp.id
execute if data storage vexp:custom_block frying_pan_visual_item as @e[type=item_display,tag=vexp.frying_pan.new,sort=nearest,limit=1,distance=..1] run data modify entity @s item set from storage vexp:custom_block frying_pan_visual_item
tag @e[type=item_display,tag=vexp.frying_pan.new] remove vexp.frying_pan.new
