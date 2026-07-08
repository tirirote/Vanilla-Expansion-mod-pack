# on_tick.mcfunction
# Ejecutar AS la interaction de la trapdoor.

execute if entity @s[tag=vexp.open_trapdoor_anim] if score @s vexp.block_anim matches 1.. run function vexp:custom_block/blocks/trapdoor/open_anim
execute if entity @s[tag=vexp.close_trapdoor_anim] if score @s vexp.block_anim matches 1.. run function vexp:custom_block/blocks/trapdoor/close_anim
execute unless entity @s[tag=vexp.open_trapdoor_anim] unless entity @s[tag=vexp.close_trapdoor_anim] run function vexp:custom_block/blocks/trapdoor/apply_display_anchor

# Soporte redstone via estado open de la iron_trapdoor hitbox
execute unless block ~ ~ ~ #replaceable run function vexp:custom_block/blocks/trapdoor/redstone_tick

# Si no hay bloque de soporte, la trapdoor custom se rompe y limpia el drop de hitbox.
execute if block ~ ~ ~ #replaceable run kill @e[type=item,distance=..1.5,nbt={Item:{id:"minecraft:iron_trapdoor"}}]
execute if block ~ ~ ~ #replaceable run function vexp:custom_block/break with entity @s data.vexp
