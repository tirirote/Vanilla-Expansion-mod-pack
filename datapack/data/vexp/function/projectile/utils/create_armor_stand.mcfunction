# projectile/utils/create_armor_stand.mcfunction
# Helper unificado para crear proyectiles base tipo armor_stand.
# Se llama con: function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn
# storage vexp:temp projectile_spawn:
# - projectile_tag: "vexp.algun_tag"
# - proj_type: "nombre_tipo"
# - proj_data: {} o compound con data.proj inicial

$summon minecraft:item_display ~ ~ ~ {Tags:["vexp.projectile","vexp.temp_projectile","$(projectile_tag)"],data:{proj_type:"$(proj_type)",proj:$(proj_data)},item:{id:"minecraft:air"},brightness:{block:15,sky:15},transformation:{translation:[0f,0.25f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0.4f,0.4f,0.4f]},teleport_duration:8,interpolation_duration:8}
