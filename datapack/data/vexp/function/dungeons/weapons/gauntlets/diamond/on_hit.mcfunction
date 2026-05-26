# dungeons/gauntlets/on_hit.mcfunction
# @s is the target entity

# Atraer ligeramente (fuerza negativa, y:0.15 para evitar que la fricción lo pegue al suelo)
function vexp:utils/motion/apply_knockback {strength:0.5, y:0.1}

effect give @p[tag=vexp.attacker,limit=1] resistance 2 0 true

# Visuals
execute positioned ~ ~1 ~ run function vexp:utils/hits/weak_punch_hit
execute positioned ~ ~1 ~ run function vexp:utils/hits/diamond_hit
function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player"}
