# Se ejecuta AS la interaction de la sarten
# Avanza un tick de coccion y transforma al llegar al tiempo objetivo

execute unless score @s vexp.cook_time matches 0.. run scoreboard players set @s vexp.cook_time 0

scoreboard players add @s vexp.cook_time 1
execute store result entity @s data.vexp.cook_time int 1 run scoreboard players get @s vexp.cook_time

scoreboard players set #did_cook vexp.math 0

# Transformaciones al completar 60 ticks
function vexp:custom_block/blocks/frying_pan/cooking_items

execute if score #did_cook vexp.math matches 1 run data modify entity @s data.vexp.cook_time set value 0
execute if score #did_cook vexp.math matches 1 run function vexp:custom_block/blocks/frying_pan/spawn_item_visual
execute if score #did_cook vexp.math matches 1 run function vexp:custom_block/macro/sound {sound:"minecraft:entity.experience_orb.pickup"}
execute if score #did_cook vexp.math matches 1 run function vexp:custom_block/macro/sound {sound:"minecraft:entity.generic.extinguish_fire"}
execute if score #did_cook vexp.math matches 1 run particle composter ^ ^.2 ^-0.25 0.1 0.1 0.1 0.1 3

execute if score @s vexp.cook_time matches ..20 run particle entity_effect{color:910438690} ^ ^.2 ^-0.25 0.1 0.1 0.1 0 1
execute if score @s vexp.cook_time matches 20..40 run particle entity_effect{color:-2124792280} ^ ^.2 ^-0.25 0.1 0.1 0.1 0 1
execute if score @s vexp.cook_time matches 40..60 run particle entity_effect{color:-1583126991} ^ ^.2 ^-0.25 0.1 0.1 0.1 0 1
