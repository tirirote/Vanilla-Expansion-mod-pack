# Actualizar el modelo del item_display del bloque según contenido + estado

execute unless data entity @s data.vexp.jar_content run return fail
execute unless data entity @s data.vexp.jar_fill_state run return fail

scoreboard players operation #jar_id vexp.id = @s vexp.id

data remove storage vexp:custom_block jar_model
data modify storage vexp:custom_block jar_model.content set from entity @s data.vexp.jar_content
data modify storage vexp:custom_block jar_model.state set from entity @s data.vexp.jar_fill_state

function vexp:custom_block/blocks/jar/update_display_model_macro with storage vexp:custom_block jar_model
