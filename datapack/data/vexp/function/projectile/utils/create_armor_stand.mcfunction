# projectile/utils/create_armor_stand.mcfunction
# Helper unificado para crear proyectiles base tipo armor_stand.
# Se llama con: function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn
# storage vexp:temp projectile_spawn:
# - projectile_tag: "vexp.algun_tag"
# - proj_type: "nombre_tipo"
# - proj_data: {} o compound con data.proj inicial

$summon minecraft:armor_stand ~ ~ ~ {Tags:["vexp.projectile","vexp.temp_projectile","$(projectile_tag)"],data:{proj_type:"$(proj_type)",proj:$(proj_data)},Marker:1b,Small:1b,Invisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b}
