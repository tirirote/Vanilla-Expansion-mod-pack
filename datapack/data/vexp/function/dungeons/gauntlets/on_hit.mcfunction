# dungeons/gauntlets/on_hit.mcfunction
# @s is the target entity

# Atraer ligeramente (fuerza negativa, y:0.15 para evitar que la fricción lo pegue al suelo)
function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}

# Visuals
particle minecraft:small_gust ~ ~1.2 ~ 0 0 0 0.05 1
playsound minecraft:entity.player.attack.strong player @a ~ ~ ~ 1 1.5