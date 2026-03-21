# dungeons/scythe/projectile/on_hit_block.mcfunction
# Efecto al golpear un bloque
# @s es el proyectil

# Efectos visuales y sonoros
particle minecraft:small_gust ~ ~ ~ 0.2 0.2 0.2 0.2 15
function vexp:utils/sound {sound: "minecraft:entity.evoker.prepare_summon", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.player.attack.strong", type: "player"}
