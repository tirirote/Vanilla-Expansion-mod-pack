# Etiquetar la entidad como bala
tag @s add vexp.handgun.bullet

# Etiquetar al jugador que disparó
tag @p add vexp.handgun.owner

# Copiar la rotación del jugador a la bala
data modify entity @s Rotation set from entity @p[tag=vexp.handgun.owner] Rotation

# Establecer un contador de vida (ej. 60 ticks = 3 segundos)
scoreboard players set @s vexp.bullet_life 60

# Iniciar el feedback visual y sonoro
function vexp:handgun/shoot_feedback

# Iniciar el movimiento de la bala
function vexp:handgun/raycast_loop