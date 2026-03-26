# Integración con combo_system: marcar objetivo y procesar hit del owner de la bala.
# Knockback al impactar con una entidad
execute as @e[tag=vexp.proj_target] at @s run function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.05}

# Sonido de disparo y partículas iniciales
particle minecraft:lava ~ ~ ~ 0 0 0 0 1
particle minecraft:explosion ~ ~ ~ 0 0 0 0.05 1
particle campfire_cosy_smoke ~ ~ ~ 0.2 0.2 0.2 0.05 3

function vexp:utils/sound {sound: "minecraft:entity.firework_rocket.large_blast", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.firework_rocket.twinkle_far", type: "player"}

# Identificar al jugador propietario por vexp.id compartido con la bala
execute store result score #proj_owner_id vexp.math run scoreboard players get @s vexp.id
execute as @a if score @s vexp.id = #proj_owner_id vexp.math run tag @s add vexp.handgun.owner

# Aplicar daño del proyectil al objetivo
execute store result score #temp vexp.math run data get entity @s data.proj.damage
execute as @e[tag=vexp.proj_target,limit=1] store result storage vexp:temp damage int 1 run scoreboard players get #temp vexp.math
data modify storage vexp:temp owner set value "@p[tag=vexp.handgun.owner,limit=1]"
execute as @e[tag=vexp.proj_target,limit=1] run function vexp:utils/apply_player_attack_damage with storage vexp:temp

# Limpiar tag temporal
tag @a[tag=vexp.handgun.owner] remove vexp.handgun.owner
