# spawn_visual.mcfunction
# Macro para spawnear un item display en la posición correcta
# Input: $(y), $(item), $(id)

# 1. Spawn del display con el ítem completo (id, componentes, etc)
$summon item_display ~ ~$(y) ~ {Tags:["vexp.jar.inventory","vexp.jar.new"],item:$(item),transformation:{translation:[0f,0f,0f],scale:[0.4f,0.4f,0.4f],left_rotation:[1f,0f,0f,1f],right_rotation:[0f,0f,0f,1f]}}

# 2. Vincular ID
$execute as @e[type=item_display,tag=vexp.jar.new,limit=1] run scoreboard players set @s vexp.id $(id)

# 3. Rotación Aleatoria en el eje Y (Yaw)
# Usamos nuestra utilidad de número aleatorio
function vexp:utils/get_random_128
execute as @e[tag=vexp.jar.new,limit=1] store result entity @s Rotation[0] float 1 run scoreboard players get #random vexp.id

# Limpieza tag
tag @e[tag=vexp.jar.new] remove vexp.jar.new