# Ejecutar AS la interaction de la puerta

# Si no hay bloque de soporte, la puerta custom se rompe y limpia el drop de hitbox.
execute if block ~ ~-1 ~ air run kill @e[type=item,distance=..1.5,nbt={Item:{id:"minecraft:iron_door"}}]
execute if block ~ ~-1 ~ air run function vexp:custom_block/break

# Soporte redstone via estado open de la iron_door hitbox
execute unless block ~ ~-1 ~ air run function vexp:custom_block/blocks/door/redstone_tick
