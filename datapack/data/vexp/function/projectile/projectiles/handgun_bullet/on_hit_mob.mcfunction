# Integración con combo_system: marcar objetivo y procesar hit del owner de la bala.
# Knockback al impactar con una entidad
execute as @e[tag=vexp.proj_target] at @s run function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.05}

# Sonido de disparo y partículas iniciales
function vexp:utils/hits/fire_hit
particle campfire_cosy_smoke ~ ~ ~ 0.2 0.2 0.2 0.005 1

function vexp:utils/sound {sound: "minecraft:entity.firework_rocket.large_blast", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.firework_rocket.twinkle_far", type: "player"}
