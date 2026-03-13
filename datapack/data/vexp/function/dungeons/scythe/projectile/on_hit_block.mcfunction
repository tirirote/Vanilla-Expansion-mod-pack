# dungeons/scythe/projectile/on_hit_block.mcfunction
# Efecto al golpear un bloque
# @s es el proyectil

# Efectos visuales y sonoros
particle minecraft:squid_ink ~ ~ ~ 0.2 0.2 0.2 0.05 3
function vexp:utils/sound {sound: "minecraft:entity.phantom.flap", type: "player"}
