# Ejecutado como la INTERACTION (Silla)
execute if entity @s[tag=vexp.occupied] run return fail

# Guardar ID de la silla activa para vincular montura y asiento.
scoreboard players operation #chair_mount_id vexp.id = @s vexp.id

# Buscar mobs atados al jugador actual en un radio cercano.
tag @e[tag=vexp.sit_candidate,sort=nearest,limit=1,distance=..1] remove vexp.sit_candidate
tag @e[tag=vexp.is_sitting_mob,sort=nearest,distance=..1,limit=1] remove vexp.is_sitting_mob
execute on target run tag @s add vexp.chair_actor
execute on target as @e[type=!player,sort=nearest,distance=..5] if function vexp:custom_block/blocks/chair/check_leasher run tag @s add vexp.sit_candidate

# Rama A: sentar mob prioritario.
execute as @e[tag=vexp.sit_candidate,sort=nearest,distance=..5,limit=1] run function vexp:custom_block/blocks/chair/sit_mob

# Rama B: sentar jugador solo si no hubo mob candidato.
execute on target unless entity @e[tag=vexp.sit_candidate,sort=nearest,distance=..5,limit=1] run function vexp:custom_block/blocks/chair/sit_logic

# 4. Añadir animación de jitter
tag @s add vexp.block.jitter
scoreboard players set @s vexp.block_anim 10

# Sonido
function vexp:custom_block/macro/sound {sound:"minecraft:block.fence_gate.close"}

# Limpieza de tags temporales.
execute on target run tag @s remove vexp.chair_actor
tag @e[tag=vexp.sit_candidate,sort=nearest,distance=..5,limit=1] remove vexp.sit_candidate
