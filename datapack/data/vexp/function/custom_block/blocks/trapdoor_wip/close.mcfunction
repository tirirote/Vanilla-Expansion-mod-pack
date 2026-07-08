# close.mcfunction
# Ejecutar AS la interaction de la trapdoor.

stopsound @a[distance=..10] * block.iron_trapdoor.open
stopsound @a[distance=..10] * block.iron_trapdoor.close

# Marcar estado cerrado
tag @s remove vexp.trapdoor_opened
tag @s add vexp.trapdoor_pending_close
data modify entity @s data.vexp.trap_open set value 0b

# Animación suave
tag @s add vexp.close_trapdoor_anim
scoreboard players set @s vexp.block_anim 10

# Agendar colocación de la hitbox cerrada
function vexp:custom_block/blocks/trapdoor/on_closed_animation_finish
