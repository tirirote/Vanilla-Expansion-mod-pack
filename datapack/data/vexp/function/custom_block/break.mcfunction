# 1. Soltar el ítem usando la macro genérica
# Usamos el objeto 'vexp' guardado en la interacción
function vexp:custom_block/macro/drop with entity @s data.vexp

# 2. Matar el modelo visual vinculado por ID
scoreboard players operation #temp vexp.id = @s vexp.id
execute as @e[type=item_display,tag=vexp.custom_block.display] if score @s vexp.id = #temp vexp.id run kill @s

# 3. Sonido y partículas dinámicos
$function vexp:custom_block/macro/sound {sound:"$(s_break)"}
$function vexp:custom_block/macro/particle {particle:"$(p_break)"}

# 4. Matar la interacción
kill @s