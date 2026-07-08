# open.mcfunction
# Ejecutar AS la interaction de la trapdoor.

stopsound @a[distance=..10] * block.iron_trapdoor.open
stopsound @a[distance=..10] * block.iron_trapdoor.close

# Marcar estado abierto y remover cierre pendiente
tag @s add vexp.trapdoor_opened
tag @s remove vexp.trapdoor_pending_close
data modify entity @s data.vexp.trap_open set value 1b

# Animación suave
tag @s add vexp.open_trapdoor_anim
scoreboard players set @s vexp.block_anim 10

# Mantener hitbox abierta para redstone
function vexp:custom_block/blocks/trapdoor/apply_block_state
