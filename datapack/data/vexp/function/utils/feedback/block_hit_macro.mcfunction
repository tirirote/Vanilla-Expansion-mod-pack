#Feedback dinámico de impacto en el bloque

# Reproducir el sonido dinámico
$playsound $(sound) player @a[distance=..10] ~ ~ ~ 0.8 1.2

# Generar la partícula dinámica basada en el bloque real impactado
# Usamos $(particle_id) si queremos precisión total, o $(particle) para grupos
$particle block{block_state:{Name:"$(particle_id)"}} ~ ~ ~ 0.2 0.2 0.2 0.1 15