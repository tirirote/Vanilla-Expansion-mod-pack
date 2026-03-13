# dungeons/gauntlets/on_hit.mcfunction
# @s is the target entity

# Atraer ligeramente (fuerza negativa, y:0.15 para evitar que la fricción lo pegue al suelo)
function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}

# Visuals
particle minecraft:small_gust ~ ~ ~ 0 0 0 0.05 1
function vexp:utils/sound {sound: "minecraft:entity.player.attack.strong", type: "player"}