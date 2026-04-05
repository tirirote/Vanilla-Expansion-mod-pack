# 1. Preparar datos para soltar el ítem (handle fallback para item_model)
data modify storage vexp:custom_block item_drop set from entity @s data.vexp
execute unless data storage vexp:custom_block item_drop.item_model run data modify storage vexp:custom_block item_drop.item_model set from storage vexp:custom_block item_drop.model

# Normalizar dimensiones a float conservando hasta 2 decimales
execute if data storage vexp:custom_block item_drop.width store result storage vexp:custom_block item_drop.width float 0.01 run data get storage vexp:custom_block item_drop.width 100
execute if data storage vexp:custom_block item_drop.height store result storage vexp:custom_block item_drop.height float 0.01 run data get storage vexp:custom_block item_drop.height 100

# Soltar el ítem usando la macro genérica
function vexp:custom_block/macro/drop with storage vexp:custom_block item_drop

# 2. Matar el modelo visual vinculado por ID
scoreboard players operation #temp vexp.id = @s vexp.id
execute as @e[type=item_display,tag=vexp.custom_block.display] if score @s vexp.id = #temp vexp.id run kill @s

# 3. Sonido y partículas dinámicos
$function vexp:custom_block/macro/sound {sound:"$(s_break)"}
$function vexp:custom_block/macro/particle {particle:"$(p_break)"}

# 4. Hook para limpieza específica del bloque (opcional)
$function vexp:custom_block/blocks/$(type)/on_break

# 5. Matar la interacción
kill @s
