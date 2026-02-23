# TNT Stick Tick
# Ejecutado en el loop principal

execute as @a at @s if score @s vexp.tnt_stick_used matches 1.. run function vexp:tnt_stick/on_use

# Capturar proyectiles de dispensers o fallbacks
execute as @e[type=experience_bottle,nbt={Item:{components:{"minecraft:custom_data":{vexp:{type:"tnt_stick"}}}}}] at @s run function vexp:tnt_stick/catch_projectile

# Lógica para Proyectiles (En vuelo o en suelo esperando explotar)
execute as @e[tag=vexp.tnt_projectile] at @s run function vexp:tnt_stick/projectile/tick
