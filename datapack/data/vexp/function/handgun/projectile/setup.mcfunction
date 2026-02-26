# Copiar la rotación del jugador a la bala mediante tp
data modify entity @s Rotation set from entity @p[tag=vexp.handgun.owner,limit=1,distance=..2] Rotation

# Establecer un contador de vida (ej. 60 ticks = 3 segundos)
scoreboard players set @s vexp.bullet_life 10

tag @s remove vexp.handgun.new_bullet