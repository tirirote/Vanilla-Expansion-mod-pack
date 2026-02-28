# @s es la bala, extraemos el formato selector @a[scores={vexp.id=X},limit=1]
data modify storage vexp:temp damage_data set value {damage:"4", type:"minecraft:generic", owner: ""}
data modify storage vexp:temp damage_data.owner set from entity @s item.components."minecraft:custom_data".owner

# Ejecutar la macro de daño en el mob impactado
execute positioned ~ ~-1.25 ~ as @e[type=!player,type=!item_display,type=!interaction,type=!marker,distance=..1.5,sort=nearest,limit=1] run function vexp:utils/deal_damage with storage vexp:temp damage_data

# Aplicar retroceso al mob basado en la rotación de la bala (@s)
execute rotated as @s positioned ~ ~-1.25 ~ as @e[type=!player,type=!item_display,type=!interaction,type=!marker,distance=..1.5,sort=nearest,limit=1] at @s positioned ~ ~.25 ~ if block ^ ^ ^-1 #minecraft:replaceable run tp @s ^ ^ ^0.2

function vexp:handgun/projectile/hit_effects
# Eliminar la bala
kill @s