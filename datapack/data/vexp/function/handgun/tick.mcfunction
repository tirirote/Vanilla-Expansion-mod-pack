# Reducir el cooldown global de disparo si está activo
execute as @a[scores={vexp.handgun_cooldown=1..}] run scoreboard players remove @s vexp.handgun_cooldown 1

# Interacción para ataque (disparo) - solo a jugadores con la pistola
execute as @a if items entity @s weapon.mainhand *[custom_data~{vexp:{type:"handgun"}}] at @s run function vexp:handgun/manage_hitbox

# Eliminar hitboxes huérfanas
execute as @e[type=interaction,tag=vexp.gun_hitbox] at @s unless entity @a[distance=..2,nbt={SelectedItem:{components:{"minecraft:custom_data":{vexp:{type:"handgun"}}}}}] run kill @s

# Procesar balas en movimiento
execute as @e[type=item_display,tag=vexp.handgun.bullet] at @s run function vexp:handgun/projectile/tick