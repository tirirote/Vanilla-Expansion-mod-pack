# 1. Preparar el storage con valores de respaldo (Fallback)
data modify storage vexp:macro feedback set value {sound:"minecraft:block.stone.hit", particle_id:"minecraft:stone"}

# 2. GENERAR EL ÍTEM TEMPORAL
# Spawneamos el botín del bloque exactamente donde impactó. 
# Usamos un tag único para poder identificarlo al instante.
loot spawn ~ ~ ~ mine ~ ~ ~ minecraft:diamond_pickaxe[enchantments={"minecraft:silk_touch":1b}]

# 3. CAPTURAR DATOS Y ELIMINAR (Todo en el mismo tick)
# Buscamos la entidad tipo item más cercana (que acabamos de spawnear)

# Extraemos el ID del ítem al storage
data modify storage vexp:macro feedback.particle_id set from entity @e[type=item,distance=..1,limit=1,sort=nearest] Item.id

# Eliminamos el ítem inmediatamente para que no lo recojan
kill @e[type=item,distance=..1,limit=1,sort=nearest]

# 4. LÓGICA DE SONIDOS (Se mantiene igual)
execute if block ~ ~ ~ #minecraft:mineable/pickaxe run data modify storage vexp:macro feedback.sound set value "minecraft:block.stone.hit"
execute if block ~ ~ ~ #minecraft:mineable/shovel run data modify storage vexp:macro feedback.sound set value "minecraft:block.gravel.hit"
execute if block ~ ~ ~ #minecraft:mineable/axe run data modify storage vexp:macro feedback.sound set value "minecraft:block.wood.hit"

# 5. EJECUCIÓN DE LA MACRO
function vexp:utils/feedback/block_hit_macro with storage vexp:macro feedback