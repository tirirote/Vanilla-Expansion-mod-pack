# 1. Preparar datos para soltar el ítem
data remove storage vexp:custom_block item_drop
data modify storage vexp:custom_block item_drop set value {id:0, model:"", width:0.0d, height:0.0d, type:"", name:"", s_place:"", s_break:"", p_break:"", scale:1.0f, y:0.0f,placeable_anywhere: 0b}

# 2. Hook para limpieza específica del bloque (opcional)
$function vexp:custom_block/blocks/$(type)/on_break

# 3. Preparar storage para el drop
data modify storage vexp:custom_block item_drop merge from entity @s data.vexp
execute unless data storage vexp:custom_block item_drop.wp_id run data modify storage vexp:custom_block item_drop.wp_id set value 0

# 3. Puertas y otros bloques con modelo dual: al soltar, usar el item_model si existe.
execute if data storage vexp:custom_block item_drop.item_model run data modify storage vexp:custom_block item_drop.model set from storage vexp:custom_block item_drop.item_model

# 4. Soltar el ítem usando la macro genérica
execute unless entity @s[tag=vexp.prevent_drop] unless data entity @s data.vexp{type:"pile_of_books"} run function vexp:custom_block/macro/drop with storage vexp:custom_block item_drop

# 5. Matar el modelo visual vinculado por ID
execute store result score #temp_id vexp.id run data get storage vexp:custom_block item_drop.vexp_id
execute store result score #temp_display_id vexp.id run data get entity @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] data.vexp.vexp_id
execute as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] if score #temp_display_id vexp.id = #temp_id vexp.id run kill @s

# 6. Sonido y partículas dinámicos
$function vexp:custom_block/macro/sound {sound:"$(s_break)"}
$function vexp:custom_block/macro/particle {particle:"$(p_break)"}

# 7. Matar la interacción
kill @s
