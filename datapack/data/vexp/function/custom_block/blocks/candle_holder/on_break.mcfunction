# on_break.mcfunction
# Se ejecuta AS la interaction del candelabro.

# Si tenia vela insertada, soltarla como item
execute if data entity @s data.vexp.candle_item run summon item ~ ~0.6 ~ {Tags:["vexp.candle_holder_break_drop"],Item:{id:"minecraft:candle",count:1}}
execute if data entity @s data.vexp.candle_item as @e[type=item,tag=vexp.candle_holder_break_drop,sort=nearest,limit=1,distance=..1] run data modify entity @s Item.id set from entity @e[type=interaction,tag=vexp.custom_block.interact,sort=nearest,limit=1,distance=..1] data.vexp.candle_item
execute as @e[type=item,tag=vexp.candle_holder_break_drop,sort=nearest,limit=1,distance=..1] at @s run function vexp:utils/motion/apply_random_motion {"range":100,"scale":0.001}
tag @e[type=item,tag=vexp.candle_holder_break_drop,sort=nearest,limit=1,distance=..1] remove vexp.candle_holder_break_drop
