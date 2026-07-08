# on_break.mcfunction
# Ejecutar AS la interaction de la trapdoor.

tag @s remove vexp.trapdoor_opened
tag @s remove vexp.trapdoor_pending_close

# Limpieza defensiva de trapdoor fisica
execute if block ~ ~ ~ iron_trapdoor run setblock ~ ~ ~ air strict
