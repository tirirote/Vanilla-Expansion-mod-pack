# Integración con combo_system: marcar objetivo y procesar hit del owner de la bala.
# Knockback al impactar con una entidad
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] at @s run function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.2}

# Sonido de disparo y partículas iniciales
function vexp:dungeons/fx/hits/fire_hit

function vexp:utils/sound {sound: "minecraft:entity.firework_rocket.large_blast", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:entity.firework_rocket.twinkle_far", type: "player", pitch:1}
