# 1. Validar que tenga el tag de vexp (por seguridad)
# (Ya lo filtramos en tick, pero aquí extraemos datos)

# 2. Extraer datos del Item Frame a un almacenamiento temporal
# {id, model, width, height, type, name, s_place, s_break, p_break}
# Limpiamos storage previo para evitar conflictos
data remove storage vexp:custom_block placement
data merge storage vexp:custom_block {placement:{id:0,model:"",width:0.0d,height:0.0d,type:"",name:"",s_place:"",s_break:"",p_break:""}}
data modify storage vexp:custom_block placement set from entity @s data.vexp

# Normalizar dimensiones a float conservando hasta 2 decimales
execute if data storage vexp:custom_block placement.width store result storage vexp:custom_block placement.width float 0.01 run data get storage vexp:custom_block placement.width 100
execute if data storage vexp:custom_block placement.height store result storage vexp:custom_block placement.height float 0.01 run data get storage vexp:custom_block placement.height 100

# Restringir placement: solo item_frame en el suelo (encima de bloque)
execute unless data entity @s {Facing:1b} if data storage vexp:custom_block placement.id run function vexp:custom_block/macro/drop with storage vexp:custom_block placement
execute unless data entity @s {Facing:1b} run kill @s

# 3. Llamar a la macro de spawn con los datos extraídos
# Solo si hay datos válidos (id)
execute if data entity @s {Facing:1b} if data storage vexp:custom_block placement.id run function vexp:custom_block/macro/spawn with storage vexp:custom_block placement

# 4. Limpieza (Si se spawneó, matamos el frame)
execute if data entity @s {Facing:1b} if data storage vexp:custom_block placement.id run kill @s
