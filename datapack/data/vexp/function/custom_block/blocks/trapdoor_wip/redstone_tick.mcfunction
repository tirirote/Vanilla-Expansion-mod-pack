# redstone_tick.mcfunction
# Ejecutar AS la interaction de la trapdoor.
# Sincroniza estado visual con la iron_trapdoor hitbox para soporte redstone.

function vexp:custom_block/blocks/trapdoor/sync_state_from_block

tag @s remove vexp.tmp_redstone_open
tag @s remove vexp.tmp_redstone_close

execute unless entity @s[tag=vexp.trapdoor_pending_close] unless entity @s[tag=vexp.trapdoor_opened] if block ~ ~ ~ iron_trapdoor[open=true] run tag @s add vexp.tmp_redstone_open
execute if entity @s[tag=vexp.trapdoor_opened] unless block ~ ~ ~ iron_trapdoor[open=true] run tag @s add vexp.tmp_redstone_close

# Bloquear sonido vanilla de la hitbox
execute if block ~ ~ ~ iron_trapdoor[open=true] run stopsound @a[distance=..16] * block.iron_trapdoor.open
execute if block ~ ~ ~ iron_trapdoor[open=true] run stopsound @a[distance=..16] * block.iron_trapdoor.close

execute if entity @s[tag=vexp.tmp_redstone_open] run function vexp:custom_block/blocks/trapdoor/open
execute if entity @s[tag=vexp.tmp_redstone_close] run function vexp:custom_block/blocks/trapdoor/close

tag @s remove vexp.tmp_redstone_open
tag @s remove vexp.tmp_redstone_close
